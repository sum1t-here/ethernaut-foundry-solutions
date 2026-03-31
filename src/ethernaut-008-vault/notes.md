# Ethernaut #8 - Vault

**Goal**
- The goal of this level is to unlock the vault.

**Solution**

```solidity
bytes32 private password;
```

In Solidity, private variables are not actually private. They are just not accessible from other contracts. However, they are still stored in the contract's storage and can be accessed by anyone who knows the storage layout.
