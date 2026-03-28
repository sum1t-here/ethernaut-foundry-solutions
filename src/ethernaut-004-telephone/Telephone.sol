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
