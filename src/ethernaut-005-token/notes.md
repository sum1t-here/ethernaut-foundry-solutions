# Ethernaut #5 - Token

**Goal**
- The goal of this level is for you to hack the basic token contract below.
- You are given 20 tokens to start with and you will beat the level if you somehow manage to get your hands on any additional tokens. Preferably a very large amount of tokens.

**Solution**

```solidity
        function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] - _value >= 0);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }
```

So, if we look carefully at the `transfer` function, we can see that it uses `uint256` to store the balance of the tokens.

Suppose we have 20 tokens and we want to transfer 21 tokens to someone else.

1. `require(balances[msg.sender] - _value >= 0)`
   `uint256(20) - uint256(21) = 2^256 - 1`
   `2^256 - 1 >= 0` (uint can never be negative)
   `true`

2. `balances[msg.sender] -= _value`
   `balances[msg.sender] = 2^256 - 1`

3. `balances[_to] += _value`
   `balances[_to] = 0 + 21`
   `balances[_to] = 21`

Now we have 2^256 - 1 tokens and 21 tokens. Which is a lot of tokens.

But this underflow and overflow is fixed in Solidity 0.8.0 and above. In the actual challenge it was an outdated version of Solidity.
