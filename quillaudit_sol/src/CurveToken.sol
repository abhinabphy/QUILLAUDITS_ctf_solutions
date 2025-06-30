// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {ERC20}  from  "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract CurveToken is ERC20 {
    address public minter;
    address owner;
    mapping(address => uint256) nonces;

    constructor() ERC20("ETH/stETH Pool LP Token", "crv-stETH") {
        minter = address(1);
        owner = msg.sender;
    }

    function initialize(address _pool) external {
        require(owner == msg.sender);
        minter = _pool;
        emit Transfer(address(0), msg.sender, 0);
    }

    function mint(address _to, uint _amount) external returns (bool) {
        require(msg.sender == minter, "only minter can mint");
        _mint(_to, _amount);
        return true;
    }

    function mint_relative(address _to, uint _frac) external returns (uint) {
        uint _amount = totalSupply() * _frac / (10 ** decimals());
        require(msg.sender == minter, "only minter can mint");
        if (_amount > 0) _mint(_to, _amount);
        return _amount;
    }

    function burnFrom(address _from, uint _amount) external returns (bool) {
        require(msg.sender == minter, "only minter can burn");
        _burn(_from, _amount); 
        return true;
    }
}