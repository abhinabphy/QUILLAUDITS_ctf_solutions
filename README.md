
# 🛡️ QuillAudits CTF Season 1 — Curated Solutions

This repository contains curated solutions, technical write-ups, and exploit demonstrations for **QuillAudits CTF (Capture The Flag) Season 1** challenges.  
These solutions aim to help blockchain security researchers, auditors, and developers understand and analyze common vulnerabilities in Ethereum smart contracts, with a focus on exploitation techniques and secure coding practices.

---

## 📖 Source

All solutions and explanations in this repository are based on the official QuillAudits CTF Season 1 resources:

- 📑 [QuillAudits CTF Season 1 — Notion Directory](https://quillaudits.notion.site/5fa2aeaa032640fea65b50d8616bb9d9?v=59ddedede7f14024bad19d411316c475)

---

## 📝 About QuillAudits CTF

**QuillAudits CTF** is an interactive platform offering hands-on challenges that replicate real-world vulnerabilities found in smart contracts deployed on EVM-compatible blockchains.  
It caters to both beginners and experienced security researchers, allowing participants to enhance their Web3 security expertise through practical problem-solving.

Key topics explored in Season 1 include:

- ✅ Reentrancy attacks
- ✅ Integer overflows/underflows
- ✅ Predictable randomness
- ✅ Storage collision issues
- ✅ Delegatecall exploits
- ✅ Access control vulnerabilities  
...and more.

---

## 📂 Repository Structure
```
.
├── README.md
├── factory
│   ├── README.md
│   ├── cache
│   ├── foundry.toml
│   ├── lib
│   ├── out
│   ├── script
│   ├── src
│   └── test
└── Metatoken
    ├── README.md
    ├── cache
    ├── foundry.toml
    ├── lib
    ├── out
    ├── remappings.txt
    ├── script
    ├── src
    └── test
    next_challenges/
    .
    .
```


---

## 🚀 How to Use This Repository

1. **Browse the root  directory** — each challenge has its own folder.
2. **Read the `README.md` inside each challenge folder** — it contains:
   - Challenge description  
   - Vulnerability analysis  
   - Proof of Concept (PoC) explanation and code  
   - Remediation techniques  
3. **Study PoC contracts/scripts** to understand practical exploitation flows.
4. **Contribute** — submit alternative exploits, enhanced solutions, or improvements via pull requests.

---

## 📌 Example Challenges

| 📝 Challenge Name    | 🛡️ Category       | 🎚️ Difficulty | 🎯 Points |
|:---------------------|:------------------|:---------------|:----------|
| Road Block            | Solidity Security  | Easy            | 100        |
| VIP Bank              | Solidity Security  | Easy            | 100        |
| Confidential Hash     | Solidity Security  | Easy            | 100        |
| Safe NFT              | Solidity Security  | Medium          | 200        |
| D31eg4t3              | Solidity Security  | Easy            | 100        |
| ...                   | ...                | ...             | ...        |

> 📄 *For the complete list of challenges, visit the [official Notion file](https://quillaudits.notion.site/5fa2aeaa032640fea65b50d8616bb9d9?v=59ddedede7f14024bad19d411316c475) or the [QuillCTF GitHub repository](https://github.com/Quillhash/Quill-CTFs).*

---

## 👥 Community & Learning Resources

- 🔗 **Join the Community:** [QuillAudits CTF Discord](https://discord.com/invite/quillaudits)
- 📰 **Subscribe to Security Insights:** [HashingBits Newsletter](https://www.quillaudits.com/newsletter)
- 📑 **Explore Official CTF Repository:** [QuillCTF GitHub](https://github.com/Quillhash/Quill-CTFs)

---

## 📜 License

This repository is open-source and licensed under the [MIT License](./LICENSE).  
**Disclaimer:** This code is intended for educational, research, and personal development use only. Do not deploy intentionally vulnerable smart contracts in production or unauthorized environments.

---

## ⚔️ Final Note

Security is a continuous learning journey.  
By studying real-world vulnerabilities, practical exploit paths, and mitigation strategies through these CTF challenges, we contribute to building a safer and more secure decentralized ecosystem.

**Happy Hacking & Stay Secure! 🔐✨**
