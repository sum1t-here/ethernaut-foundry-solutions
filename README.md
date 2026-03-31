# 🏴‍☠️ Ethernaut Foundry Solutions

Smart contract security challenges solved using Foundry + Solidity.
Each level includes a written blog walkthrough explaining the vulnerability, exploit, and step-by-step instructions to complete the original Ethernaut challenge — whether you prefer the browser console, Remix IDE, or Foundry.

---

## 🛠️ Tech Stack

- [Foundry](https://book.getfoundry.sh/) — Solidity testing framework
- [forge-std](https://github.com/foundry-rs/forge-std) — Test utilities
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) — Used in some levels
- **Network** — Sepolia Testnet

---

## 🚀 Getting Started

```bash
# Clone the repo
git clone https://github.com/yourusername/ethernaut-foundry-solutions
cd ethernaut-foundry-solutions

# Install dependencies
forge install

# Build
forge build

# Run all tests
forge test

# Run specific level
forge test --match-contract <LevelName>Test -vvvv
```

---

## 📁 Project Structure

```
ethernaut-foundry-solutions/
├── src/
│   ├── ethernaut-001-fallback/
│   ├── ethernaut-002-fallout/
│   ├── ethernaut-003-coin-flip/
│   ├── ethernaut-004-telephone/
│   ├── ethernaut-005-telephone/
│   .
│   .
│   .   
│   └── ethernaut-0040-NotOptimisticPortal/
├── test/
│   ├── ethernaut-001-fallback/
│   ├── ethernaut-002-fallout/
│   ├── ethernaut-003-coin-flip/
│   ├── ethernaut-004-telephone/
│   .
│   .
│   .
│   └── ethernaut-0040-NotOptimisticPortal/
├── foundry.toml
└── README.md
```

---

## 📚 Solutions

| # | Level | Vulnerability | Foundry Test | Solution | Difficulty | Walkthrough |
|---|-------|---------------|--------------|----------|------------|------|
| 01 | [Fallback](./src/ethernaut-001-fallback/) | Weak `receive()` logic | [Test](./test/ethernaut-001-fallback/Fallback.t.sol) | [Solution](./soln/ethernaut-001-fallback.js) | 🟢 Easy | [Link](./src/ethernaut-001-fallback/notes.md) |
| 02 | [Fallout](./src/ethernaut-002-fallout/) | Typo in constructor name | [Test](./test/ethernaut-002-fallout/Fallout.t.sol) | [Solution](./soln/ethernaut-002-fallout.js) | 🟢 Easy | [Link](./src/ethernaut-002-fallout/notes.md) |
| 03 | [CoinFlip](./src/ethernaut-003-coin-flip/) | Predictable randomness | [Test](./test/ethernaut-003-coin-flip/CoinFlip.t.sol) | [Solution](./soln/ethernaut-003-coin-flip.sol) | 🟡 Medium | [Link](./src/ethernaut-003-coin-flip/notes.md) |
| 04 | [Telephone](./src/ethernaut-004-telephone/) | `tx.origin` auth bypass | [Test](./test/ethernaut-004-telephone/Telephone.t.sol) | [Solution](./soln/ethernaut-004-telephone.sol) | 🟢 Easy | [Link](./src/ethernaut-004-telephone/notes.md) |
| 05 | [Token](./src/ethernaut-005-token/) | Integer overflow | [Test](./test/ethernaut-005-token/Token.t.sol) | [Solution](./soln/ethernaut-005-token.js) | 🟢 Easy | [Link](./src/ethernaut-005-token/notes.md) |
| 06 | [Delegation](./src/ethernaut-006-delegation/) | Delegatecall storage collision | [Test](./test/ethernaut-006-delegation/Delegation.t.sol) | [Solution](./soln/ethernaut-006-delegation.js) | 🟢 Easy | [Link](./src/ethernaut-006-delegation/notes.md) |
| 07 | [Force](./src/ethernaut-007-force/) | Selfdestruct | [Test](./test/ethernaut-007-force/Force.t.sol) | [Solution](./soln/ethernaut-007-force.sol) | 🟢 Easy | [Link](./src/ethernaut-007-force/notes.md) |
| 08 | [Vault](./src/ethernaut-008-vault/) | Storing private variable | [Test](./test/ethernaut-008-vault/Vault.t.sol) | [Solution](./soln/ethernaut-008-vault.js) | 🟢 Easy | [Link](./src/ethernaut-008-vault/notes.md) |
| 09 | [King](./src/ethernaut-009-king/) | Reentrancy | [Test](./test/ethernaut-009-king/King.t.sol) | [Solution](./soln/ethernaut-009-king.js) | 🟢 Easy | [Link](./src/ethernaut-009-king/notes.md) |

---

## ⚙️ Foundry Config

```toml
[profile.default]
src = "src"
out = "out"
libs = ["lib"]
optimizer = true
optimizer_runs = 200
```

---

## ⚠️ Disclaimer

All contracts are from [Ethernaut by OpenZeppelin](https://ethernaut.openzeppelin.com/).  
This repo is purely **educational** — for learning smart contract security.

---

## 👤 Author

**Sumit** — Web3 Security Researcher  
- GitHub: [@sum1t-here](https://github.com/sum1t-here)
- Twitter: [@sum1t_here](https://twitter.com/sum1t_here)

---

> ⭐ Star this repo if you find it helpful!