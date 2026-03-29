// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
* Objective :
* - The goal of this level is for you to hack the basic token contract below.
* - You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens.
*/
contract Token {
    mapping(address => uint256) balances;
    uint256 public totalSupply;

    constructor(uint256 _initialSupply) public {
        balances[msg.sender] = totalSupply = _initialSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        // @issue: underflow, uint256 cannot be negative
        require(balances[msg.sender] - _value >= 0);
        // underflow here
        balances[msg.sender] -= _value;
        // eg: have 20 tokens
        // transfer 21 tokens
        // 20 - 21 = -1 (2^256 - 1)
        balances[_to] += _value;
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}
