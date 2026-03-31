# Ethernaut #2 - Fallout

**Goal**
- Claim ownership of the contract

**Solution**

```solidity
    function Fal1out() public payable {
        // owner = msg.sender;
        owner = payable(msg.sender);
        allocations[owner] = msg.value;
    }
```
Well this blocks look interesting. If we can call this function with the name Fal1out, we can become the owner of the contract.