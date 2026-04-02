# Ethernaut #1 - Fallback

**Goal**
- Claim ownership of the contract
- Reduce its balance to 0

**Solution**

```solidity
    function contribute() public payable {
        require(msg.value < 0.001 ether);
        contributions[msg.sender] += msg.value;
        if (contributions[msg.sender] > contributions[owner]) {
            owner = msg.sender;
        }
    }
```
If you look at this function carefully, you can see that it is possible to become the owner of the contract by contributing more than the current owner.

Voila! You are the owner of the contract.

Now you can withdraw all the ether from the contract.

But if you dive deep into the contract, you can see that there is a receive function.

```solidity
    receive() external payable {
        require(msg.value > 0 && contributions[msg.sender] > 0);
        owner = msg.sender;
    }
```

Well, this is interesting. 

If we send ether to the contract without calling any function after the first contribution, the receive function will be called. And we can become the owner of the contract by sending ether to the contract without calling any function bypassing the require check in the contribute function.

