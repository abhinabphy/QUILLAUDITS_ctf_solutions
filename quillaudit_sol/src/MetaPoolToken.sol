pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "./CurvePool.sol";
import "./CurveToken.sol";


contract MetaPoolToken is ERC20 {
    CurveToken lpToken; // Address of KP token
    CurvePool basePool; // Address of the BasePool contract

    constructor(
        CurveToken _lpToken,
        CurvePool _basePool
    ) ERC20("Meta LP Token", "MLP") {
        lpToken = _lpToken;
        basePool = _basePool;
    }

    function mint(uint256 _lpAmount) external {
        uint256 p = (_lpAmount * basePool.get_virtual_price()) / 1e18;

        require(ERC20(lpToken).transferFrom(msg.sender, address(this), _lpAmount), "KP transfer failed");

        _mint(msg.sender, p);
    }

    function burn(uint256 p) external {

        uint256 lpAmount = (p * 1e18) / basePool.get_virtual_price();

        require(balanceOf(msg.sender) >= p, "Insufficient balance");
        _burn(msg.sender, p);

        require(ERC20(lpToken).transfer(msg.sender, lpAmount), "KP transfer failed");
    }
}
