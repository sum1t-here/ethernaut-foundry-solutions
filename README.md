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

| # | Level | Vulnerability | Difficulty | Blog |
|---|-------|--------------|------------|------|
| 01 | [Fallback](./src/ethernaut-001-fallback/) | Weak `receive()` logic | 🟢 Easy | Coming soon |
| 02 | [Fallout](./src/ethernaut-002-fallout/) | Typo in constructor name | 🟢 Easy | Coming soon |
| 03 | [CoinFlip](./src/ethernaut-003-coin-flip/) | Predictable randomness | 🟡 Medium | Coming soon |
| 04 | [Telephone](./src/ethernaut-004-telephone/) | `tx.origin` auth bypass | 🟢 Easy | Coming soon |

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