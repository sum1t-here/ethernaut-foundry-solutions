// SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;
pragma solidity ^0.8.0;

/*
* Objective :
* - Claim ownership of the contract below to complete this level.
*/

import "@openzeppelin/contracts/utils/math/Math.sol";

contract Fallout {
    using Math for uint256;

    mapping(address => uint256) allocations;
    address payable public owner;

    /* constructor */
    // @issue: Not a constructor
    function Fal1out() public payable {
        // owner = msg.sender;
        owner = payable(msg.sender);
        allocations[owner] = msg.value;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not the owner");
        _;
    }

    function allocate() public payable {
        // allocations[msg.sender] = allocations[msg.sender].add(msg.value);
        allocations[msg.sender] = allocations[msg.sender] + msg.value;
    }

    function sendAllocation(address payable allocator) public {
        require(allocations[allocator] > 0);
        allocator.transfer(allocations[allocator]);
    }

    function collectAllocations() public onlyOwner {
        // msg.sender.transfer(address(this).balance);
        (bool success,) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }

    function allocatorBalance(address allocator) public view returns (uint256) {
        return allocations[allocator];
    }
}
