// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "src/ethernaut-005-token/Token.sol";

contract TokenTest is Test {
    Token public token;
    address public attacker;

    function setUp() public {
        attacker = makeAddr("attacker");
        vm.prank(attacker);
        token = new Token(20);
    }

    function testExploit() public {
        vm.startPrank(attacker);

        assertEq(token.balanceOf(attacker), 20);
        console.log("Balance of attacker: ", token.balanceOf(attacker));

        vm.expectRevert(); // expect revert because 20 - 21 = -1 (underflow)
        token.transfer(address(1), 21);

        vm.stopPrank();
    }
}
