// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// The goal of this level is for you to steal all the funds from the contract.

import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";

contract Reentrance {
    using Math for uint256;

    mapping(address => uint256) public balances;

    function donate(address _to) public payable {
        balances[_to] = balances[_to] + msg.value;
    }

    function balanceOf(address _who) public view returns (uint256 balance) {
        return balances[_who];
    }

    function withdraw(uint256 _amount) public {
        // CEI not followed

        // check followed
        if (balances[msg.sender] >= _amount) {
            // action not followed
            (bool result,) = msg.sender.call{value: _amount}("");
            if (result) {
                _amount;
            }
            // effect not followed
            unchecked {
                balances[msg.sender] -= _amount;
            }
        }
    }

    receive() external payable {}
}
