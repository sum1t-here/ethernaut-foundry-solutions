# Ethernaut #4 - Telephone

**Goal**
- Claim ownership of the contract

**Solution**

```solidity
    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
```

This contract uses `tx.origin` to check the ownership. `tx.origin` is the address of the account that initiated the transaction. `msg.sender` is the address of the account that called the function. 

So we can create a contract that calls this function and becomes the owner of the contract.

`Attacker wallet (tx.origin) -> Attacker contract (msg.sender) -> Telephone contract`