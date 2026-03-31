# Ethernaut #7 - Force

**Goal**
- The goal of this level is to make the balance of the contract greater than zero.

**Solution**

We will use a contract with **selfdestruct** to send ETH to the contract.

```solidity
selfdestruct(payable(targetAddress));
//            ^^^^^^^^^^^^^^^^^^^^
//            ALL ETH goes here forcefully
```

It does **two things simultaneously:**

1. 💀 Destroys the contract
   → removes bytecode from blockchain
   → storage wiped
   → contract address becomes empty

2. 💸 Forces ALL ETH to target
   → bypasses receive()
   → bypasses fallback()
   → no way to reject it!

---

## 🔍 Visual

BEFORE selfdestruct:

AttackContract
┌─────────────────┐
│ balance: 1 ETH  │
│ bytecode: exists│
│ storage: exists │
└─────────────────┘

AFTER selfdestruct(target):

AttackContract            Force Contract
┌─────────────────┐      ┌─────────────────┐
│ balance: 0      │      │ balance: 1 ETH  │
│ bytecode: gone  │  ──→ │ (forced in!)    │
│ storage: gone   │      └─────────────────┘
└─────────────────┘
     💀 DEAD