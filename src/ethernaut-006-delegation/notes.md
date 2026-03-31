# Ethernaut #6 - Delegation

**Goal**
- The goal of this level is for you to claim ownership of the instance you are given.

**Solution**

BEFORE ATTACK:

Delegation Storage:          Delegate Storage:
┌─────────────────────┐      ┌─────────────────────┐
│ slot 0: owner       │      │ slot 0: owner        │
│ = DeployerAddress   │      │ = DeployerAddress    │
├─────────────────────┤      ├─────────────────────┤
│ slot 1: delegate    │      └─────────────────────┘
│ = DelegateAddress   │
└─────────────────────┘

AFTER ATTACK:

Delegation Storage:          Delegate Storage:
┌─────────────────────┐      ┌─────────────────────┐
│ slot 0: owner       │      │ slot 0: owner        │
│ = AttackerAddress ✅│      │ = DeployerAddress ❌ │
├─────────────────────┤      │   (UNCHANGED!)       │
│ slot 1: delegate    │      └─────────────────────┘
│ = DelegateAddress   │
└─────────────────────┘

**Step by step analysis**

```solidity 
// pwn() code runs in Delegation's context

function pwn() public {
    owner = msg.sender;
//  ^^^^^
//  This means SLOT 0
//  But WHOSE slot 0?
//  → Delegation's slot 0! ✅
//  → Delegate's slot 0 never touched ❌
}
```

---

## Simple Mental Model

`delegatecall` = 
"borrow the CODE from Delegate
 but run it in MY house (Delegation's storage)"

pwn() says → "set slot 0 = msg.sender"
Delegation hears → "ok, MY slot 0 = attacker" ✅
Delegate → "nobody talked to me" ❌