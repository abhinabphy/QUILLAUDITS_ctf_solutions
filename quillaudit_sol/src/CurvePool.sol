// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";//quillaudit_sol/lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "./CurveToken.sol";

contract CurvePool is ReentrancyGuard {
    event TokenExchange(address indexed buyer, int128 sold_id, uint tokens_sold, int128 bought_id, uint tokens_bought);
    event TokenExchangeUnderlying(address indexed buyer, int128 sold_id, uint tokens_sold, int128 bought_id, uint tokens_bought);
    event AddLiquidity(address indexed provider, uint[2] amounts, uint[2] fees, uint invariant, uint token_supply); 
    event RemoveLiquidity(address indexed provider, uint[2] amounts, uint[2] fees, uint token_supply);
    event RemoveLiquidityOne(address indexed provider, uint token_amount, uint coin_amount);
    event CommitNewFee(uint indexed deadline, uint fee, uint admin_fee);
    event NewFee(uint fee, uint admin_fee);
    event RampA(uint old_A, uint new_A, uint initial_time, uint future_time);
    event StopRampA(uint A, uint time);

    uint constant FEE_DENOMINATOR = 10 ** 10;
    uint constant PRECISION = 10 ** 18;
    uint constant MAX_ADMIN_FEE = 10 * 10 ** 9;
    uint constant MAX_FEE = 5 * 10 ** 9;
    uint constant MAX_A = 10 ** 6;
    uint constant MAX_A_CHANGE = 10;
    uint constant A_PRECISION = 100;
    uint constant ADMIN_ACTIONS_DELAY = 3 * 86400;
    uint constant MIN_RAMP_TIME = 86400;

    address[2] public coins;
    uint[2] public admin_balances;

    uint public fee;
    uint public admin_fee;

    address public owner;
    address public lp_token;

    uint public initial_A;
    uint public future_A;
    uint public initial_A_time; 
    uint public future_A_time;

    uint public admin_actions_deadline; 
    uint public future_fee; 
    uint public future_admin_fee; 

    constructor(
        address _owner,
        address[2] memory _coins,
        address _pool_token, 
        uint _a,
        uint _fee,
        uint _admin_fee
    ) ReentrancyGuard() {
        assert(_coins[0] == 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);
        assert(_coins[1] != address(0));

        coins = _coins; 
        initial_A = _a * A_PRECISION;
        future_A = _a * A_PRECISION;
        fee = _fee;
        admin_fee = _admin_fee;
        owner = _owner;
        lp_token = _pool_token;
    }

    /* External view functions */

    function A() external view returns (uint) {
        return _A() / A_PRECISION;
    }

    function A_precise() external view returns (uint) {
        return _A();
    }

    function balances(uint i) external view returns (uint) {
        return _balances(0)[i];
    }

    function get_virtual_price() external view returns (uint) {
        /**
         * @notice The current virtual price of the pool LP token
         * @dev Useful for calculating profits
         * @return LP token virtual price normalized to 1e18
         */
        uint d = get_D(_balances(0), _A());
        uint token_supply = ERC20(lp_token).totalSupply();
        return d * PRECISION / token_supply;
    }

    /**
     * @notice Calculate addition or reduction in token supply from a deposit or withdrawal
     * @dev This calculation accounts for slippage, but not fees.
            Needed to prevent front-running, not for precise calculations!
     * @param amounts Amount of each coin being deposited
     * @param is_deposit set True for deposits, False for withdrawals
     * @return Expected amount of LP tokens received
     */
    function calc_token_amount(
        uint[2] memory amounts, 
        bool is_deposit
    ) external view returns (uint) {
        
        uint amp = _A();
        uint[2] memory bals = _balances(0);
        uint d0 = get_D(bals, amp);

        for (uint i; i < 2; i++) {
            if (is_deposit) {
                bals[i] += amounts[i];
            } else {
                bals[i] -= amounts[i];
            }
        }
        uint d1 = get_D(bals, amp);
        uint token_amount = ERC20(lp_token).totalSupply();
        uint diff = 0;
        if (is_deposit) {
            diff = d1 - d0;
        } else {
            diff = d0 - d1;
        }
        return diff * token_amount / d0;
    }

    function get_dy(int128 i, int128 j, uint dx) external view returns (uint) {
        uint[2] memory xp = _balances(0);
        uint x = xp[uint128(i)] + dx;
        uint y = get_y(i, j, x, xp);
        uint dy = xp[uint128(j)] - y - 1;
        uint _fee = fee * dy / FEE_DENOMINATOR;
        return dy - _fee;
    }

    /* External state-modifying functions */

    /**
     * @notice Deposit coins into the pool
     * @param amounts List of amounts of coins to deposit
     * @param min_mint_amount Minimum amount of LP tokens to mint from the deposit
     * @return Amount of LP tokens received by depositing
     */
    function add_liquidity(
        uint[2] memory amounts, 
        uint min_mint_amount
    ) external payable nonReentrant returns (uint) {
        // Initial invariant
        uint amp = _A();
        uint[2] memory old_balances = _balances(msg.value);
        uint d0 = get_D(old_balances, amp);

        uint token_supply = ERC20(lp_token).totalSupply();
        uint[2] memory new_balances = old_balances;
        
        for (uint i; i < 2; i++) {
            if (token_supply == 0) {
                assert(amounts[i] > 0);
            }
            new_balances[i] += amounts[i];
        }

        // Invariant after change
        uint d1 = get_D(new_balances, amp);
        assert(d1 > d0);

        // Recalculate the invariant accounting for fees,
        // to calculate user's fair share
        uint[2] memory fees;
        uint mint_amount = 0;
        uint d2 = 0;
        if (token_supply > 0) {
            // Only account for fees if we are not the first to deposit
            uint _fee = fee / 2;
            uint _admin_fee = admin_fee;
            for (uint i; i < 2; i++) {
                uint ideal_balance = d1 * old_balances[i] / d0;
                uint difference = 0;
                if (ideal_balance > new_balances[i]) {
                    difference = ideal_balance - new_balances[i];
                } else {
                    difference = new_balances[i] - ideal_balance;
                }
                fees[i] = _fee * difference / FEE_DENOMINATOR;
                if (_admin_fee != 0) {
                    admin_balances[i] += fees[i] * _admin_fee / FEE_DENOMINATOR;
                }
                new_balances[i] -= fees[i];
            }
            d2 = get_D(new_balances, amp);
            mint_amount = token_supply * (d2 - d0) / d0;
        } else {
            mint_amount = d1;
        }

        require(mint_amount >= min_mint_amount, "Slippage screwed you");

        // Take coins from the sender
        require(msg.value == amounts[0]);
        if (amounts[1] > 0) {
            require(ERC20(coins[1]).transferFrom(msg.sender, address(this), amounts[1]));
        }

        // Mint pool tokens
        CurveToken(lp_token).mint(msg.sender, mint_amount);

        emit AddLiquidity(msg.sender, amounts, fees, d1, token_supply + mint_amount);
        return mint_amount;
    }

    /**
     * @notice Perform an exchange between two coins
     * @dev Index values can be found via the `coins` public getter method
     * @param i Index value for the coin to send
     * @param j Index valie of the coin to recieve
     * @param dx Amount of `i` being exchanged
     * @param min_dy Minimum amount of `j` to receive
     * @return Actual amount of `j` received
     */
    function exchange(
        int128 i, 
        int128 j, 
        uint dx, 
        uint min_dy
    ) external payable nonReentrant returns (uint) {
        uint[2] memory xp = _balances(msg.value);
        uint x = xp[uint128(i)] + dx;
        uint y = get_y(i, j, x, xp);
        uint dy = xp[uint128(j)] - y - 1;
        uint dy_fee = dy * fee / FEE_DENOMINATOR;

        // Convert all to real units
        dy = dy - dy_fee;
        require(dy >= min_dy, "Exchange resulted in fewer coins than expected");

        if (admin_fee != 0) {
            uint dy_admin_fee = dy_fee * admin_fee / FEE_DENOMINATOR;
            if (dy_admin_fee != 0) admin_balances[uint128(j)] += dy_admin_fee;
        }
        
        address coin = coins[1];
        if (i == 0) {
            require(msg.value == dx);
            require(ERC20(coin).transfer(msg.sender, dy));
        } else {
            require(msg.value == 0);
            require(ERC20(coin).transferFrom(msg.sender, address(this), dx));
            (bool success,) = msg.sender.call{value: dy}("");
            require(success);
        }

        emit TokenExchange(msg.sender, i, dx, j, dy);

        return dy;
    }

    /**
     * @notice Withdraw coins from the pool
     * @dev Withdrawal amounts are based on current deposit ratios
     * @param _amount Quantity of LP tokens to burn in the withdrawal
     * @param _min_amounts Minimum amounts of underlying coins to receive
     * @return List of amounts of coins that were withdrawn
     */
    function remove_liquidity(
        uint _amount, 
        uint[2] memory _min_amounts
    ) external nonReentrant returns (uint[2] memory) {
        uint[2] memory amounts = _balances(0);
        address token = lp_token;
        uint total_supply = ERC20(token).totalSupply();
        require(CurveToken(token).burnFrom(msg.sender, _amount), "Insufficient funds");

        for (uint i; i < 2; i++) {
            uint value = amounts[i] * _amount / total_supply;
            require(value >= _min_amounts[i], "Withdraw resulted in fewer coins than expected");

            amounts[i] = value;
            if (i == 0) {
                (bool success,) = msg.sender.call{value: value}("");
            require(success);
            } else {
                require(ERC20(coins[1]).transfer(msg.sender, value));
            }
        }

        uint[2] memory empty;
        emit RemoveLiquidity(msg.sender, amounts, empty, total_supply - _amount);

        return amounts;
    }

    /* Admin functions */

    function ramp_A(uint _future_A, uint _future_time) external {
        require(msg.sender == owner, "Only owner can call");
        require(block.timestamp >= initial_A_time + MIN_RAMP_TIME, "Not enough time passed");
        require(_future_time >= block.timestamp + MIN_RAMP_TIME, "Insufficient time");

        uint _initial_A = _A();
        uint _future_A_p = _future_A * A_PRECISION;

        require(_future_A > 0 && _future_A < MAX_A, "A out of bounds");

        if (_future_A_p < _initial_A) {
            require(_future_A_p * MAX_A_CHANGE >= _initial_A);
        } else {
            require(_future_A_p <= _initial_A * MAX_A_CHANGE);
        }

        initial_A = _initial_A;
        future_A = _future_A_p;
        initial_A_time = block.timestamp;
        future_A_time = _future_time;

        emit RampA(_initial_A, _future_A_p, block.timestamp, _future_time);
    }

    function stop_ramp_A() external {
        require(msg.sender == owner, "Only owner can call");

        uint current_A = _A();
        initial_A = current_A;
        future_A = current_A;
        initial_A_time = block.timestamp;
        future_A_time = block.timestamp;

        emit StopRampA(current_A, block.timestamp);
    }

    function commit_new_fee(uint new_fee, uint new_admin_fee) external {
        require(msg.sender == owner, "Only owner can call");
        require(admin_actions_deadline == 0, "Active action");
        require(new_fee < MAX_FEE, "Fee exceeds maximum");
        require(new_admin_fee < MAX_ADMIN_FEE, "Admin fee exceeds maximum");

        uint _deadline = block.timestamp + ADMIN_ACTIONS_DELAY;
        admin_actions_deadline = _deadline;
        future_fee = new_fee;
        future_admin_fee = new_admin_fee;

        emit CommitNewFee(_deadline, new_fee, new_admin_fee);
    }

    function apply_new_fee() external nonReentrant {
        require(msg.sender == owner, "Only owner can call");
        require(block.timestamp >= admin_actions_deadline, "Insufficient time");
        require(admin_actions_deadline != 0, "No active action");

        admin_actions_deadline = 0;
        fee = future_fee;
        admin_fee = future_admin_fee;
        
        emit NewFee(fee, admin_fee);
    }

    function withdraw_admin_fees() external nonReentrant {
        require(msg.sender == owner, "Only owner can call");

        uint amount = admin_balances[0];
        if (amount != 0) {
            (bool success,) = msg.sender.call{value: amount}("");
            require(success);
        } 

        amount = admin_balances[1];
        if (amount != 0) require(ERC20(coins[1]).transfer(msg.sender, amount));

        admin_balances[0] = 0;
        admin_balances[1] = 0;
    }

    /* Internal functions */

    function _A() internal view returns (uint) {
        uint t1 = future_A_time;
        uint A1 = future_A;
        
        if (block.timestamp < t1) {
            // Handle ramping up and down of A
            uint A0 = initial_A;
            uint t0 = initial_A_time;
            // Expressions in uint cannot have negative numbers, thus "if"
            if (A1 > A0) {
                return A0 + (A1 - A0) * (block.timestamp - t0) / (t1 - t0);
            } else {
                return A0 - (A0 - A1) * (block.timestamp - t0) / (t1 - t0);
            }
        } else {
            // when t1 == 0 or block.timestamp >= t1
            return A1;
        }
    }

    function _balances(uint _value) internal view returns (uint[2] memory) {
        return [
            address(this).balance - admin_balances[0] - _value,
            ERC20(coins[1]).balanceOf(address(this)) - admin_balances[1]
        ];
    }

    function get_D(uint256[2] memory xp, uint256 amp) internal pure returns (uint256) {
        /**
         * D invariant calculation in non-overflowing integer operations iteratively

         * A * sum(x_i) * n**n + D = A * D * n**n + D**(n+1) / (n**n * prod(x_i))

         * Converging solution:
         * D[j+1] = (A * n**n * sum(x_i) - D[j]**(n+1) / (n**n prod(x_i))) / (A * n**n - 1)
         */
        uint s = 0;
        uint dPrev = 0;

        for (uint i; i < 2; i++) {
            s += xp[i];
        }
        if (s == 0) return 0;

        uint d = s;
        uint ann = amp * 2;
        for (uint i; i < 255; i++) {
            uint d_p = d;
            for (uint j; j < 2; j++) {
                d_p = d_p * d / (xp[j] * 2 + 1);
            }
            dPrev = d;
            d = (ann * s / A_PRECISION + d_p * 2) * d / ((ann - A_PRECISION) * d / A_PRECISION + 3 * d_p);
            if (d > dPrev) {
                if (d - dPrev <= 1) return d;
            } else {
                if (dPrev - d <= 1) return d;
            }
        }
        // convergence typically occurs in 4 rounds or less, this should be unreachable!
        // if it does happen the pool is borked and LPs can withdraw via `remove_liquidity`
        revert("Pool is borked!");
    }

    function get_y(int128 i, int128 j, uint x, uint[2] memory xp) internal view returns (uint) {
        /**
         * Calculate x[j] if one makes x[i] = x

         * Done by solving quadratic equation iteratively.
         * x_1**2 + x1 * (sum' - (A*n**n - 1) * D / (A * n**n)) = D ** (n + 1) / (n ** (2 * n) * prod' * A)
         * x_1**2 + b*x_1 = c

         * x_1 = (x_1**2 + c) / (2*x_1 + b)
         */
        // x in the input is converted to the same price/precision

        require(i != j, "same coin");
        require(j >= 0, "j below 0");
        require(j < 2, "j above N_COINS");
        require(i >= 0, "i below 0");
        require(i < 2, "i above N_COINS");
        
        uint amp = _A();
        uint d = get_D(xp, amp);
        uint ann = amp * 2;
        uint c = d;
        uint s_ = 0;
        uint _x = 0;
        uint y_prev = 0;

        for (int _i = 0; _i < 2; _i++) {
            if (_i == i) {
                _x = x;
            } else {
                if (_i != j) {
                    _x = xp[uint(_i)];
                } else {
                    continue;
                }
            }
            s_ += _x;
            c = c * d / (_x * 2);
        }
        c = c * d * A_PRECISION / (ann * 2);
        uint b = s_ + d * A_PRECISION / ann;
        uint y = d;
        for (uint _i; _i < 255; i++) {
            y_prev = y;
            y = (y * y + c) / (2 * y + b - d);
            if (y > y_prev) {
                if (y - y_prev <= 1) return y;
            } else {
                if (y_prev - y <= 1) return y;
            }
        }
        revert("Pool is borked!");
    }

}