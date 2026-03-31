# Ethernaut #9 - King

**Goal**
The contract below represents a very simple game: whoever sends it an amount of ether that is larger than the current prize becomes the new king. On such an event, the overthrown king gets paid the new prize, making a bit of ether in the process! As ponzi as it gets xD
Such a fun game. Your goal is to break it.
When you submit the instance back to the level, the level is going to reclaim kingship. You will beat the level if you can avoid such a self proclamation.


**Solution**

```solidity
receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
}
```

In this function we can see that if someone sends more ether than the current prize, they become the new king. 

What if an attacker sends a contract as a king with no receive or fallback function?

`payable(king).transfer(msg.value);` will fail and the transaction will be reverted.

And that contract will remain as the king. 