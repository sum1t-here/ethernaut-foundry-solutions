# Ethernaut #3 - Coin Flip

**Goal**
- Flip 10 consecutive times and win the game.

**Solution**

Well this is a classic one. The contract uses `blockhash(block.number - 1)` to generate a random number. 

This is not a random number because the blockhash is known to the miner who mines the block. 