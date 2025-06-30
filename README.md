
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
```ultree
QUILLAUDITS_ctf_solutions
├── README.md
├── factory
│   ├── README.md
│   ├── cache
│   │   ├── solidity-files-cache.json
│   │   └── test-failures
│   ├── foundry.toml
│   ├── lib
│   │   └── forge-std
│   │       ├── CONTRIBUTING.md
│   │       ├── LICENSE-APACHE
│   │       ├── LICENSE-MIT
│   │       ├── README.md
│   │       ├── foundry.toml
│   │       ├── package.json
│   │       ├── scripts
│   │       │   └── vm.py
│   │       ├── src
│   │       │   ├── Base.sol
│   │       │   ├── Script.sol
│   │       │   ├── StdAssertions.sol
│   │       │   ├── StdChains.sol
│   │       │   ├── StdCheats.sol
│   │       │   ├── StdConstants.sol
│   │       │   ├── StdError.sol
│   │       │   ├── StdInvariant.sol
│   │       │   ├── StdJson.sol
│   │       │   ├── StdMath.sol
│   │       │   ├── StdStorage.sol
│   │       │   ├── StdStyle.sol
│   │       │   ├── StdToml.sol
│   │       │   ├── StdUtils.sol
│   │       │   ├── Test.sol
│   │       │   ├── Vm.sol
│   │       │   ├── console.sol
│   │       │   ├── console2.sol
│   │       │   ├── interfaces
│   │       │   │   ├── IERC1155.sol
│   │       │   │   ├── IERC165.sol
│   │       │   │   ├── IERC20.sol
│   │       │   │   ├── IERC4626.sol
│   │       │   │   ├── IERC6909.sol
│   │       │   │   ├── IERC721.sol
│   │       │   │   ├── IERC7540.sol
│   │       │   │   ├── IERC7575.sol
│   │       │   │   └── IMulticall3.sol
│   │       │   └── safeconsole.sol
│   │       └── test
│   │           ├── CommonBase.t.sol
│   │           ├── StdAssertions.t.sol
│   │           ├── StdChains.t.sol
│   │           ├── StdCheats.t.sol
│   │           ├── StdConstants.t.sol
│   │           ├── StdError.t.sol
│   │           ├── StdJson.t.sol
│   │           ├── StdMath.t.sol
│   │           ├── StdStorage.t.sol
│   │           ├── StdStyle.t.sol
│   │           ├── StdToml.t.sol
│   │           ├── StdUtils.t.sol
│   │           ├── Vm.t.sol
│   │           ├── compilation
│   │           │   ├── CompilationScript.sol
│   │           │   ├── CompilationScriptBase.sol
│   │           │   ├── CompilationTest.sol
│   │           │   └── CompilationTestBase.sol
│   │           └── fixtures
│   │               ├── broadcast.log.json
│   │               ├── test.json
│   │               └── test.toml
│   ├── out
│   │   ├── Base.sol
│   │   │   ├── CommonBase.json
│   │   │   ├── ScriptBase.json
│   │   │   └── TestBase.json
│   │   ├── Counter.t.sol
│   │   │   └── testfactory.json
│   │   ├── IMulticall3.sol
│   │   │   └── IMulticall3.json
│   │   ├── StdAssertions.sol
│   │   │   └── StdAssertions.json
│   │   ├── StdChains.sol
│   │   │   └── StdChains.json
│   │   ├── StdCheats.sol
│   │   │   ├── StdCheats.json
│   │   │   └── StdCheatsSafe.json
│   │   ├── StdConstants.sol
│   │   │   └── StdConstants.json
│   │   ├── StdError.sol
│   │   │   └── stdError.json
│   │   ├── StdInvariant.sol
│   │   │   └── StdInvariant.json
│   │   ├── StdJson.sol
│   │   │   └── stdJson.json
│   │   ├── StdMath.sol
│   │   │   └── stdMath.json
│   │   ├── StdStorage.sol
│   │   │   ├── stdStorage.json
│   │   │   └── stdStorageSafe.json
│   │   ├── StdStyle.sol
│   │   │   └── StdStyle.json
│   │   ├── StdToml.sol
│   │   │   └── stdToml.json
│   │   ├── StdUtils.sol
│   │   │   └── StdUtils.json
│   │   ├── Test.sol
│   │   │   └── Test.json
│   │   ├── Vm.sol
│   │   │   ├── Vm.json
│   │   │   └── VmSafe.json
│   │   ├── build-info
│   │   │   ├── 300bbec564eb80ce.json
│   │   │   └── 634b834b52c5d114.json
│   │   ├── console.sol
│   │   │   └── console.json
│   │   ├── factory.sol
│   │   │   └── factory.json
│   │   └── safeconsole.sol
│   │       └── safeconsole.json
│   ├── script
│   │   └── Counter.s.sol
│   ├── src
│   │   └── factory.sol
│   └── test
│       └── Counter.t.sol
└── quillaudit_sol
    ├── README.md
    ├── cache
    │   ├── solidity-files-cache.json
    │   └── test-failures
    ├── foundry.toml
    ├── lib
    │   ├── forge-std
    │   │   ├── CONTRIBUTING.md
    │   │   ├── LICENSE-APACHE
    │   │   ├── LICENSE-MIT
    │   │   ├── README.md
    │   │   ├── foundry.toml
    │   │   ├── package.json
    │   │   ├── scripts
    │   │   │   └── vm.py
    │   │   ├── src
    │   │   │   ├── Base.sol
    │   │   │   ├── Script.sol
    │   │   │   ├── StdAssertions.sol
    │   │   │   ├── StdChains.sol
    │   │   │   ├── StdCheats.sol
    │   │   │   ├── StdConstants.sol
    │   │   │   ├── StdError.sol
    │   │   │   ├── StdInvariant.sol
    │   │   │   ├── StdJson.sol
    │   │   │   ├── StdMath.sol
    │   │   │   ├── StdStorage.sol
    │   │   │   ├── StdStyle.sol
    │   │   │   ├── StdToml.sol
    │   │   │   ├── StdUtils.sol
    │   │   │   ├── Test.sol
    │   │   │   ├── Vm.sol
    │   │   │   ├── console.sol
    │   │   │   ├── console2.sol
    │   │   │   ├── interfaces
    │   │   │   │   ├── IERC1155.sol
    │   │   │   │   ├── IERC165.sol
    │   │   │   │   ├── IERC20.sol
    │   │   │   │   ├── IERC4626.sol
    │   │   │   │   ├── IERC6909.sol
    │   │   │   │   ├── IERC721.sol
    │   │   │   │   ├── IERC7540.sol
    │   │   │   │   ├── IERC7575.sol
    │   │   │   │   └── IMulticall3.sol
    │   │   │   └── safeconsole.sol
    │   │   └── test
    │   │       ├── CommonBase.t.sol
    │   │       ├── StdAssertions.t.sol
    │   │       ├── StdChains.t.sol
    │   │       ├── StdCheats.t.sol
    │   │       ├── StdConstants.t.sol
    │   │       ├── StdError.t.sol
    │   │       ├── StdJson.t.sol
    │   │       ├── StdMath.t.sol
    │   │       ├── StdStorage.t.sol
    │   │       ├── StdStyle.t.sol
    │   │       ├── StdToml.t.sol
    │   │       ├── StdUtils.t.sol
    │   │       ├── Vm.t.sol
    │   │       ├── compilation
    │   │       │   ├── CompilationScript.sol
    │   │       │   ├── CompilationScriptBase.sol
    │   │       │   ├── CompilationTest.sol
    │   │       │   └── CompilationTestBase.sol
    │   │       └── fixtures
    │   │           ├── broadcast.log.json
    │   │           ├── test.json
    │   │           └── test.toml
    │   └── openzeppelin-contracts
    │       ├── CHANGELOG.md
    │       ├── CODE_OF_CONDUCT.md
    │       ├── CONTRIBUTING.md
    │       ├── FUNDING.json
    │       ├── GUIDELINES.md
    │       ├── LICENSE
    │       ├── README.md
    │       ├── RELEASING.md
    │       ├── SECURITY.md
    │       ├── audits
    │       │   ├── 2017-03.md
    │       │   ├── 2018-10.pdf
    │       │   ├── 2022-10-Checkpoints.pdf
    │       │   ├── 2022-10-ERC4626.pdf
    │       │   ├── 2023-05-v4.9.pdf
    │       │   ├── 2023-10-v5.0.pdf
    │       │   ├── 2024-10-v5.1.pdf
    │       │   ├── 2024-12-v5.2.pdf
    │       │   └── README.md
    │       ├── certora
    │       │   ├── Makefile
    │       │   ├── README.md
    │       │   ├── diff
    │       │   │   └── access_manager_AccessManager.sol.patch
    │       │   ├── harnesses
    │       │   │   ├── AccessControlDefaultAdminRulesHarness.sol
    │       │   │   ├── AccessControlHarness.sol
    │       │   │   ├── AccessManagedHarness.sol
    │       │   │   ├── AccessManagerHarness.sol
    │       │   │   ├── DoubleEndedQueueHarness.sol
    │       │   │   ├── ERC20FlashMintHarness.sol
    │       │   │   ├── ERC20PermitHarness.sol
    │       │   │   ├── ERC20WrapperHarness.sol
    │       │   │   ├── ERC3156FlashBorrowerHarness.sol
    │       │   │   ├── ERC721Harness.sol
    │       │   │   ├── ERC721ReceiverHarness.sol
    │       │   │   ├── EnumerableMapHarness.sol
    │       │   │   ├── EnumerableSetHarness.sol
    │       │   │   ├── InitializableHarness.sol
    │       │   │   ├── NoncesHarness.sol
    │       │   │   ├── Ownable2StepHarness.sol
    │       │   │   ├── OwnableHarness.sol
    │       │   │   ├── PausableHarness.sol
    │       │   │   └── TimelockControllerHarness.sol
    │       │   ├── reports
    │       │   │   ├── 2021-10.pdf
    │       │   │   ├── 2022-03.pdf
    │       │   │   └── 2022-05.pdf
    │       │   ├── run.js
    │       │   ├── specs
    │       │   └── specs.json
    │       │       ├── AccessControl.spec
    │       │       ├── AccessControlDefaultAdminRules.spec
    │       │       ├── AccessManaged.spec
    │       │       ├── AccessManager.spec
    │       │       ├── DoubleEndedQueue.spec
    │       │       ├── ERC20.spec
    │       │       ├── ERC20FlashMint.spec
    │       │       ├── ERC20Wrapper.spec
    │       │       ├── ERC721.spec
    │       │       ├── EnumerableMap.spec
    │       │       ├── EnumerableSet.spec
    │       │       ├── Initializable.spec
    │       │       ├── Nonces.spec
    │       │       ├── Ownable.spec
    │       │       ├── Ownable2Step.spec
    │       │       ├── Pausable.spec
    │       │       ├── TimelockController.spec
    │       │       ├── helpers
    │       │       │   └── helpers.spec
    │       │       └── methods
    │       │           ├── IAccessControl.spec
    │       │           ├── IAccessControlDefaultAdminRules.spec
    │       │           ├── IAccessManaged.spec
    │       │           ├── IAccessManager.spec
    │       │           ├── IERC20.spec
    │       │           ├── IERC2612.spec
    │       │           ├── IERC3156FlashBorrower.spec
    │       │           ├── IERC3156FlashLender.spec
    │       │           ├── IERC5313.spec
    │       │           ├── IERC721.spec
    │       │           ├── IERC721Receiver.spec
    │       │           ├── IOwnable.spec
    │       │           └── IOwnable2Step.spec
    │       ├── contracts
    │       │   ├── access
    │       │   │   ├── AccessControl.sol
    │       │   │   ├── IAccessControl.sol
    │       │   │   ├── Ownable.sol
    │       │   │   ├── Ownable2Step.sol
    │       │   │   ├── README.adoc
    │       │   │   ├── extensions
    │       │   │   │   ├── AccessControlDefaultAdminRules.sol
    │       │   │   │   ├── AccessControlEnumerable.sol
    │       │   │   │   ├── IAccessControlDefaultAdminRules.sol
    │       │   │   │   └── IAccessControlEnumerable.sol
    │       │   │   └── manager
    │       │   │       ├── AccessManaged.sol
    │       │   │       ├── AccessManager.sol
    │       │   │       ├── AuthorityUtils.sol
    │       │   │       ├── IAccessManaged.sol
    │       │   │       ├── IAccessManager.sol
    │       │   │       └── IAuthority.sol
    │       │   ├── account
    │       │   │   ├── README.adoc
    │       │   │   └── utils
    │       │   │       ├── draft-ERC4337Utils.sol
    │       │   │       └── draft-ERC7579Utils.sol
    │       │   ├── finance
    │       │   │   ├── README.adoc
    │       │   │   ├── VestingWallet.sol
    │       │   │   └── VestingWalletCliff.sol
    │       │   ├── governance
    │       │   │   ├── Governor.sol
    │       │   │   ├── IGovernor.sol
    │       │   │   ├── README.adoc
    │       │   │   ├── TimelockController.sol
    │       │   │   ├── extensions
    │       │   │   │   ├── GovernorCountingFractional.sol
    │       │   │   │   ├── GovernorCountingOverridable.sol
    │       │   │   │   ├── GovernorCountingSimple.sol
    │       │   │   │   ├── GovernorPreventLateQuorum.sol
    │       │   │   │   ├── GovernorProposalGuardian.sol
    │       │   │   │   ├── GovernorSequentialProposalId.sol
    │       │   │   │   ├── GovernorSettings.sol
    │       │   │   │   ├── GovernorStorage.sol
    │       │   │   │   ├── GovernorSuperQuorum.sol
    │       │   │   │   ├── GovernorTimelockAccess.sol
    │       │   │   │   ├── GovernorTimelockCompound.sol
    │       │   │   │   ├── GovernorTimelockControl.sol
    │       │   │   │   ├── GovernorVotes.sol
    │       │   │   │   ├── GovernorVotesQuorumFraction.sol
    │       │   │   │   └── GovernorVotesSuperQuorumFraction.sol
    │       │   │   └── utils
    │       │   │       ├── IVotes.sol
    │       │   │       ├── Votes.sol
    │       │   │       └── VotesExtended.sol
    │       │   ├── interfaces
    │       │   │   ├── IERC1155.sol
    │       │   │   ├── IERC1155MetadataURI.sol
    │       │   │   ├── IERC1155Receiver.sol
    │       │   │   ├── IERC1271.sol
    │       │   │   ├── IERC1363.sol
    │       │   │   ├── IERC1363Receiver.sol
    │       │   │   ├── IERC1363Spender.sol
    │       │   │   ├── IERC165.sol
    │       │   │   ├── IERC1820Implementer.sol
    │       │   │   ├── IERC1820Registry.sol
    │       │   │   ├── IERC1967.sol
    │       │   │   ├── IERC20.sol
    │       │   │   ├── IERC20Metadata.sol
    │       │   │   ├── IERC2309.sol
    │       │   │   ├── IERC2612.sol
    │       │   │   ├── IERC2981.sol
    │       │   │   ├── IERC3156.sol
    │       │   │   ├── IERC3156FlashBorrower.sol
    │       │   │   ├── IERC3156FlashLender.sol
    │       │   │   ├── IERC4626.sol
    │       │   │   ├── IERC4906.sol
    │       │   │   ├── IERC5267.sol
    │       │   │   ├── IERC5313.sol
    │       │   │   ├── IERC5805.sol
    │       │   │   ├── IERC6372.sol
    │       │   │   ├── IERC721.sol
    │       │   │   ├── IERC721Enumerable.sol
    │       │   │   ├── IERC721Metadata.sol
    │       │   │   ├── IERC721Receiver.sol
    │       │   │   ├── IERC777.sol
    │       │   │   ├── IERC777Recipient.sol
    │       │   │   ├── IERC777Sender.sol
    │       │   │   ├── README.adoc
    │       │   │   ├── draft-IERC1822.sol
    │       │   │   ├── draft-IERC4337.sol
    │       │   │   ├── draft-IERC6093.sol
    │       │   │   ├── draft-IERC6909.sol
    │       │   │   ├── draft-IERC7579.sol
    │       │   │   └── draft-IERC7674.sol
    │       │   ├── metatx
    │       │   │   ├── ERC2771Context.sol
    │       │   │   ├── ERC2771Forwarder.sol
    │       │   │   └── README.adoc
    │       │   ├── mocks
    │       │   │   ├── AccessManagedTarget.sol
    │       │   │   ├── AccessManagerMock.sol
    │       │   │   ├── ArraysMock.sol
    │       │   │   ├── AuthorityMock.sol
    │       │   │   ├── Base64Dirty.sol
    │       │   │   ├── BatchCaller.sol
    │       │   │   ├── CallReceiverMock.sol
    │       │   │   ├── ConstructorMock.sol
    │       │   │   ├── ContextMock.sol
    │       │   │   ├── DummyImplementation.sol
    │       │   │   ├── EIP712Verifier.sol
    │       │   │   ├── ERC1271WalletMock.sol
    │       │   │   ├── ERC165
    │       │   │   │   ├── ERC165InterfacesSupported.sol
    │       │   │   │   ├── ERC165MaliciousData.sol
    │       │   │   │   ├── ERC165MissingData.sol
    │       │   │   │   ├── ERC165NotSupported.sol
    │       │   │   │   └── ERC165ReturnBomb.sol
    │       │   │   ├── ERC2771ContextMock.sol
    │       │   │   ├── ERC3156FlashBorrowerMock.sol
    │       │   │   ├── EtherReceiverMock.sol
    │       │   │   ├── InitializableMock.sol
    │       │   │   ├── MerkleProofCustomHashMock.sol
    │       │   │   ├── MerkleTreeMock.sol
    │       │   │   ├── MulticallHelper.sol
    │       │   │   ├── MultipleInheritanceInitializableMocks.sol
    │       │   │   ├── PausableMock.sol
    │       │   │   ├── ReentrancyAttack.sol
    │       │   │   ├── ReentrancyMock.sol
    │       │   │   ├── ReentrancyTransientMock.sol
    │       │   │   ├── RegressionImplementation.sol
    │       │   │   ├── SingleInheritanceInitializableMocks.sol
    │       │   │   ├── Stateless.sol
    │       │   │   ├── StorageSlotMock.sol
    │       │   │   ├── TimelockReentrant.sol
    │       │   │   ├── TransientSlotMock.sol
    │       │   │   ├── UpgradeableBeaconMock.sol
    │       │   │   ├── VotesExtendedMock.sol
    │       │   │   ├── VotesMock.sol
    │       │   │   ├── account
    │       │   │   │   └── utils
    │       │   │   │       └── ERC7579UtilsMock.sol
    │       │   │   ├── compound
    │       │   │   │   └── CompTimelock.sol
    │       │   │   ├── docs
    │       │   │   │   ├── ERC20WithAutoMinerReward.sol
    │       │   │   │   ├── ERC4626Fees.sol
    │       │   │   │   ├── MyNFT.sol
    │       │   │   │   ├── access-control
    │       │   │   │   │   ├── AccessControlERC20MintBase.sol
    │       │   │   │   │   ├── AccessControlERC20MintMissing.sol
    │       │   │   │   │   ├── AccessControlERC20MintOnlyRole.sol
    │       │   │   │   │   ├── AccessControlModified.sol
    │       │   │   │   │   ├── AccessControlNonRevokableAdmin.sol
    │       │   │   │   │   ├── AccessManagedERC20MintBase.sol
    │       │   │   │   │   └── MyContractOwnable.sol
    │       │   │   │   ├── governance
    │       │   │   │   │   ├── MyGovernor.sol
    │       │   │   │   │   ├── MyToken.sol
    │       │   │   │   │   ├── MyTokenTimestampBased.sol
    │       │   │   │   │   └── MyTokenWrapped.sol
    │       │   │   │   ├── token
    │       │   │   │   │   ├── ERC1155
    │       │   │   │   │   │   ├── GameItems.sol
    │       │   │   │   │   │   └── MyERC115HolderContract.sol
    │       │   │   │   │   ├── ERC20
    │       │   │   │   │   │   └── GLDToken.sol
    │       │   │   │   │   ├── ERC6909
    │       │   │   │   │   │   └── ERC6909GameItems.sol
    │       │   │   │   │   └── ERC721
    │       │   │   │   │       └── GameItem.sol
    │       │   │   │   └── utilities
    │       │   │   │       ├── Base64NFT.sol
    │       │   │   │       └── Multicall.sol
    │       │   │   ├── governance
    │       │   │   │   ├── GovernorCountingOverridableMock.sol
    │       │   │   │   ├── GovernorFractionalMock.sol
    │       │   │   │   ├── GovernorMock.sol
    │       │   │   │   ├── GovernorPreventLateQuorumMock.sol
    │       │   │   │   ├── GovernorProposalGuardianMock.sol
    │       │   │   │   ├── GovernorSequentialProposalIdMock.sol
    │       │   │   │   ├── GovernorStorageMock.sol
    │       │   │   │   ├── GovernorSuperQuorumMock.sol
    │       │   │   │   ├── GovernorTimelockAccessMock.sol
    │       │   │   │   ├── GovernorTimelockCompoundMock.sol
    │       │   │   │   ├── GovernorTimelockControlMock.sol
    │       │   │   │   ├── GovernorVoteMock.sol
    │       │   │   │   ├── GovernorVotesSuperQuorumFractionMock.sol
    │       │   │   │   └── GovernorWithParamsMock.sol
    │       │   │   ├── proxy
    │       │   │   │   ├── BadBeacon.sol
    │       │   │   │   ├── ClashingImplementation.sol
    │       │   │   │   └── UUPSUpgradeableMock.sol
    │       │   │   └── token
    │       │   │       ├── ERC1155ReceiverMock.sol
    │       │   │       ├── ERC1363ForceApproveMock.sol
    │       │   │       ├── ERC1363NoReturnMock.sol
    │       │   │       ├── ERC1363ReceiverMock.sol
    │       │   │       ├── ERC1363ReturnFalseMock.sol
    │       │   │       ├── ERC1363SpenderMock.sol
    │       │   │       ├── ERC20ApprovalMock.sol
    │       │   │       ├── ERC20DecimalsMock.sol
    │       │   │       ├── ERC20ExcessDecimalsMock.sol
    │       │   │       ├── ERC20FlashMintMock.sol
    │       │   │       ├── ERC20ForceApproveMock.sol
    │       │   │       ├── ERC20GetterHelper.sol
    │       │   │       ├── ERC20Mock.sol
    │       │   │       ├── ERC20MulticallMock.sol
    │       │   │       ├── ERC20NoReturnMock.sol
    │       │   │       ├── ERC20Reentrant.sol
    │       │   │       ├── ERC20ReturnFalseMock.sol
    │       │   │       ├── ERC20VotesAdditionalCheckpointsMock.sol
    │       │   │       ├── ERC20VotesLegacyMock.sol
    │       │   │       ├── ERC20VotesTimestampMock.sol
    │       │   │       ├── ERC4626LimitsMock.sol
    │       │   │       ├── ERC4626Mock.sol
    │       │   │       ├── ERC4626OffsetMock.sol
    │       │   │       ├── ERC4646FeesMock.sol
    │       │   │       ├── ERC721ConsecutiveEnumerableMock.sol
    │       │   │       ├── ERC721ConsecutiveMock.sol
    │       │   │       ├── ERC721ReceiverMock.sol
    │       │   │       └── ERC721URIStorageMock.sol
    │       │   ├── package.json
    │       │   ├── proxy
    │       │   │   ├── Clones.sol
    │       │   │   ├── ERC1967
    │       │   │   │   ├── ERC1967Proxy.sol
    │       │   │   │   └── ERC1967Utils.sol
    │       │   │   ├── Proxy.sol
    │       │   │   ├── README.adoc
    │       │   │   ├── beacon
    │       │   │   │   ├── BeaconProxy.sol
    │       │   │   │   ├── IBeacon.sol
    │       │   │   │   └── UpgradeableBeacon.sol
    │       │   │   ├── transparent
    │       │   │   │   ├── ProxyAdmin.sol
    │       │   │   │   └── TransparentUpgradeableProxy.sol
    │       │   │   └── utils
    │       │   │       ├── Initializable.sol
    │       │   │       └── UUPSUpgradeable.sol
    │       │   ├── token
    │       │   │   ├── ERC1155
    │       │   │   │   ├── ERC1155.sol
    │       │   │   │   ├── IERC1155.sol
    │       │   │   │   ├── IERC1155Receiver.sol
    │       │   │   │   ├── README.adoc
    │       │   │   │   ├── extensions
    │       │   │   │   │   ├── ERC1155Burnable.sol
    │       │   │   │   │   ├── ERC1155Pausable.sol
    │       │   │   │   │   ├── ERC1155Supply.sol
    │       │   │   │   │   ├── ERC1155URIStorage.sol
    │       │   │   │   │   └── IERC1155MetadataURI.sol
    │       │   │   │   └── utils
    │       │   │   │       ├── ERC1155Holder.sol
    │       │   │   │       └── ERC1155Utils.sol
    │       │   │   ├── ERC20
    │       │   │   │   ├── ERC20.sol
    │       │   │   │   ├── IERC20.sol
    │       │   │   │   ├── README.adoc
    │       │   │   │   ├── extensions
    │       │   │   │   │   ├── ERC1363.sol
    │       │   │   │   │   ├── ERC20Burnable.sol
    │       │   │   │   │   ├── ERC20Capped.sol
    │       │   │   │   │   ├── ERC20FlashMint.sol
    │       │   │   │   │   ├── ERC20Pausable.sol
    │       │   │   │   │   ├── ERC20Permit.sol
    │       │   │   │   │   ├── ERC20Votes.sol
    │       │   │   │   │   ├── ERC20Wrapper.sol
    │       │   │   │   │   ├── ERC4626.sol
    │       │   │   │   │   ├── IERC20Metadata.sol
    │       │   │   │   │   ├── IERC20Permit.sol
    │       │   │   │   │   └── draft-ERC20TemporaryApproval.sol
    │       │   │   │   └── utils
    │       │   │   │       ├── ERC1363Utils.sol
    │       │   │   │       └── SafeERC20.sol
    │       │   │   ├── ERC6909
    │       │   │   │   ├── README.adoc
    │       │   │   │   ├── draft-ERC6909.sol
    │       │   │   │   └── extensions
    │       │   │   │       ├── draft-ERC6909ContentURI.sol
    │       │   │   │       ├── draft-ERC6909Metadata.sol
    │       │   │   │       └── draft-ERC6909TokenSupply.sol
    │       │   │   ├── ERC721
    │       │   │   │   ├── ERC721.sol
    │       │   │   │   ├── IERC721.sol
    │       │   │   │   ├── IERC721Receiver.sol
    │       │   │   │   ├── README.adoc
    │       │   │   │   ├── extensions
    │       │   │   │   │   ├── ERC721Burnable.sol
    │       │   │   │   │   ├── ERC721Consecutive.sol
    │       │   │   │   │   ├── ERC721Enumerable.sol
    │       │   │   │   │   ├── ERC721Pausable.sol
    │       │   │   │   │   ├── ERC721Royalty.sol
    │       │   │   │   │   ├── ERC721URIStorage.sol
    │       │   │   │   │   ├── ERC721Votes.sol
    │       │   │   │   │   ├── ERC721Wrapper.sol
    │       │   │   │   │   ├── IERC721Enumerable.sol
    │       │   │   │   │   └── IERC721Metadata.sol
    │       │   │   │   └── utils
    │       │   │   │       ├── ERC721Holder.sol
    │       │   │   │       └── ERC721Utils.sol
    │       │   │   └── common
    │       │   │       ├── ERC2981.sol
    │       │   │       └── README.adoc
    │       │   ├── utils
    │       │   │   ├── Address.sol
    │       │   │   ├── Arrays.sol
    │       │   │   ├── Base64.sol
    │       │   │   ├── Bytes.sol
    │       │   │   ├── CAIP10.sol
    │       │   │   ├── CAIP2.sol
    │       │   │   ├── Calldata.sol
    │       │   │   ├── Comparators.sol
    │       │   │   ├── Context.sol
    │       │   │   ├── Create2.sol
    │       │   │   ├── Errors.sol
    │       │   │   ├── Multicall.sol
    │       │   │   ├── Nonces.sol
    │       │   │   ├── NoncesKeyed.sol
    │       │   │   ├── Packing.sol
    │       │   │   ├── Panic.sol
    │       │   │   ├── Pausable.sol
    │       │   │   ├── README.adoc
    │       │   │   ├── ReentrancyGuard.sol
    │       │   │   ├── ReentrancyGuardTransient.sol
    │       │   │   ├── ShortStrings.sol
    │       │   │   ├── SlotDerivation.sol
    │       │   │   ├── StorageSlot.sol
    │       │   │   ├── Strings.sol
    │       │   │   ├── TransientSlot.sol
    │       │   │   ├── cryptography
    │       │   │   │   ├── ECDSA.sol
    │       │   │   │   ├── EIP712.sol
    │       │   │   │   ├── Hashes.sol
    │       │   │   │   ├── MerkleProof.sol
    │       │   │   │   ├── MessageHashUtils.sol
    │       │   │   │   ├── P256.sol
    │       │   │   │   ├── RSA.sol
    │       │   │   │   └── SignatureChecker.sol
    │       │   │   ├── introspection
    │       │   │   │   ├── ERC165.sol
    │       │   │   │   ├── ERC165Checker.sol
    │       │   │   │   └── IERC165.sol
    │       │   │   ├── math
    │       │   │   │   ├── Math.sol
    │       │   │   │   ├── SafeCast.sol
    │       │   │   │   └── SignedMath.sol
    │       │   │   ├── structs
    │       │   │   │   ├── BitMaps.sol
    │       │   │   │   ├── Checkpoints.sol
    │       │   │   │   ├── CircularBuffer.sol
    │       │   │   │   ├── DoubleEndedQueue.sol
    │       │   │   │   ├── EnumerableMap.sol
    │       │   │   │   ├── EnumerableSet.sol
    │       │   │   │   ├── Heap.sol
    │       │   │   │   └── MerkleTree.sol
    │       │   │   └── types
    │       │   │       └── Time.sol
    │       │   └── vendor
    │       │       └── compound
    │       │           ├── ICompoundTimelock.sol
    │       │           └── LICENSE
    │       ├── docs
    │       │   ├── README.md
    │       │   ├── antora.yml
    │       │   ├── config.js
    │       │   ├── modules
    │       │   │   └── ROOT
    │       │   │       ├── images
    │       │   │       │   ├── access-control-multiple.svg
    │       │   │       │   ├── access-manager-functions.svg
    │       │   │       │   ├── access-manager.svg
    │       │   │       │   ├── erc4626-attack-3a.png
    │       │   │       │   ├── erc4626-attack-3b.png
    │       │   │       │   ├── erc4626-attack-6.png
    │       │   │       │   ├── erc4626-attack.png
    │       │   │       │   ├── erc4626-deposit.png
    │       │   │       │   ├── erc4626-mint.png
    │       │   │       │   ├── erc4626-rate-linear.png
    │       │   │       │   ├── erc4626-rate-loglog.png
    │       │   │       │   ├── erc4626-rate-loglogext.png
    │       │   │       │   ├── tally-exec.png
    │       │   │       │   └── tally-vote.png
    │       │   │       ├── nav.adoc
    │       │   │       └── pages
    │       │   │           ├── access-control.adoc
    │       │   │           ├── backwards-compatibility.adoc
    │       │   │           ├── erc1155.adoc
    │       │   │           ├── erc20-supply.adoc
    │       │   │           ├── erc20.adoc
    │       │   │           ├── erc4626.adoc
    │       │   │           ├── erc6909.adoc
    │       │   │           ├── erc721.adoc
    │       │   │           ├── extending-contracts.adoc
    │       │   │           ├── faq.adoc
    │       │   │           ├── governance.adoc
    │       │   │           ├── index.adoc
    │       │   │           ├── tokens.adoc
    │       │   │           ├── upgradeable.adoc
    │       │   │           ├── utilities.adoc
    │       │   │           └── wizard.adoc
    │       │   └── templates
    │       │       ├── contract.hbs
    │       │       ├── helpers.js
    │       │       ├── page.hbs
    │       │       └── properties.js
    │       ├── eslint.config.mjs
    │       ├── foundry.toml
    │       ├── fv-requirements.txt
    │       ├── hardhat
    │       ├── hardhat.config.js
    │       │   ├── async-test-sanity.js
    │       │   ├── common-contracts.js
    │       │   ├── env-artifacts.js
    │       │   ├── ignore-unreachable-warnings.js
    │       │   ├── remappings.js
    │       │   ├── skip-foundry-tests.js
    │       │   └── task-test-get-files.js
    │       ├── lib
    │       │   ├── erc4626-tests
    │       │   │   ├── ERC4626.prop.sol
    │       │   │   ├── ERC4626.test.sol
    │       │   │   ├── LICENSE
    │       │   │   └── README.md
    │       │   ├── forge-std
    │       │   │   ├── CONTRIBUTING.md
    │       │   │   ├── LICENSE-APACHE
    │       │   │   ├── LICENSE-MIT
    │       │   │   ├── README.md
    │       │   │   ├── foundry.toml
    │       │   │   ├── package.json
    │       │   │   ├── scripts
    │       │   │   │   └── vm.py
    │       │   │   ├── src
    │       │   │   │   ├── Base.sol
    │       │   │   │   ├── Script.sol
    │       │   │   │   ├── StdAssertions.sol
    │       │   │   │   ├── StdChains.sol
    │       │   │   │   ├── StdCheats.sol
    │       │   │   │   ├── StdError.sol
    │       │   │   │   ├── StdInvariant.sol
    │       │   │   │   ├── StdJson.sol
    │       │   │   │   ├── StdMath.sol
    │       │   │   │   ├── StdStorage.sol
    │       │   │   │   ├── StdStyle.sol
    │       │   │   │   ├── StdToml.sol
    │       │   │   │   ├── StdUtils.sol
    │       │   │   │   ├── Test.sol
    │       │   │   │   ├── Vm.sol
    │       │   │   │   ├── console.sol
    │       │   │   │   ├── console2.sol
    │       │   │   │   ├── interfaces
    │       │   │   │   │   ├── IERC1155.sol
    │       │   │   │   │   ├── IERC165.sol
    │       │   │   │   │   ├── IERC20.sol
    │       │   │   │   │   ├── IERC4626.sol
    │       │   │   │   │   ├── IERC721.sol
    │       │   │   │   │   └── IMulticall3.sol
    │       │   │   │   ├── mocks
    │       │   │   │   │   ├── MockERC20.sol
    │       │   │   │   │   └── MockERC721.sol
    │       │   │   │   └── safeconsole.sol
    │       │   │   └── test
    │       │   │       ├── StdAssertions.t.sol
    │       │   │       ├── StdChains.t.sol
    │       │   │       ├── StdCheats.t.sol
    │       │   │       ├── StdError.t.sol
    │       │   │       ├── StdJson.t.sol
    │       │   │       ├── StdMath.t.sol
    │       │   │       ├── StdStorage.t.sol
    │       │   │       ├── StdStyle.t.sol
    │       │   │       ├── StdToml.t.sol
    │       │   │       ├── StdUtils.t.sol
    │       │   │       ├── Vm.t.sol
    │       │   │       ├── compilation
    │       │   │       │   ├── CompilationScript.sol
    │       │   │       │   ├── CompilationScriptBase.sol
    │       │   │       │   ├── CompilationTest.sol
    │       │   │       │   └── CompilationTestBase.sol
    │       │   │       ├── fixtures
    │       │   │       │   ├── broadcast.log.json
    │       │   │       │   ├── test.json
    │       │   │       │   └── test.toml
    │       │   │       └── mocks
    │       │   │           ├── MockERC20.t.sol
    │       │   │           └── MockERC721.t.sol
    │       │   └── halmos-cheatcodes
    │       │       ├── LICENSE
    │       │       ├── README.md
    │       │       └── src
    │       │           ├── SVM.sol
    │       │           └── SymTest.sol
    │       ├── logo.svg
    │       ├── netlify.toml
    │       ├── package-lock.json
    │       ├── package.json
    │       ├── remappings.txt
    │       ├── renovate.json
    │       ├── scripts
    │       │   ├── checks
    │       │   │   ├── compare-layout.js
    │       │   │   ├── compareGasReports.js
    │       │   │   ├── coverage.sh
    │       │   │   ├── extract-layout.js
    │       │   │   ├── generation.sh
    │       │   │   ├── inheritance-ordering.js
    │       │   │   └── pragma-consistency.js
    │       │   ├── fetch-common-contracts.js
    │       │   ├── gen-nav.js
    │       │   ├── generate
    │       │   │   ├── format-lines.js
    │       │   │   ├── helpers
    │       │   │   │   └── sanitize.js
    │       │   │   ├── run.js
    │       │   │   └── templates
    │       │   │       ├── Arrays.js
    │       │   │       ├── Arrays.opts.js
    │       │   │       ├── Checkpoints.js
    │       │   │       ├── Checkpoints.opts.js
    │       │   │       ├── Checkpoints.t.js
    │       │   │       ├── EnumerableMap.js
    │       │   │       ├── EnumerableMap.opts.js
    │       │   │       ├── EnumerableSet.js
    │       │   │       ├── EnumerableSet.opts.js
    │       │   │       ├── MerkleProof.js
    │       │   │       ├── MerkleProof.opts.js
    │       │   │       ├── Packing.js
    │       │   │       ├── Packing.opts.js
    │       │   │       ├── Packing.t.js
    │       │   │       ├── SafeCast.js
    │       │   │       ├── Slot.opts.js
    │       │   │       ├── SlotDerivation.js
    │       │   │       ├── SlotDerivation.t.js
    │       │   │       ├── StorageSlot.js
    │       │   │       ├── StorageSlotMock.js
    │       │   │       ├── TransientSlot.js
    │       │   │       ├── TransientSlotMock.js
    │       │   │       └── conversion.js
    │       │   ├── git-user-config.sh
    │       │   ├── helpers.js
    │       │   ├── prepack.sh
    │       │   ├── prepare-docs.sh
    │       │   ├── release
    │       │   │   ├── format-changelog.js
    │       │   │   ├── synchronize-versions.js
    │       │   │   ├── update-comment.js
    │       │   │   ├── version.sh
    │       │   │   └── workflow
    │       │   │       ├── exit-prerelease.sh
    │       │   │       ├── github-release.js
    │       │   │       ├── integrity-check.sh
    │       │   │       ├── pack.sh
    │       │   │       ├── publish.sh
    │       │   │       ├── rerun.js
    │       │   │       ├── set-changesets-pr-title.js
    │       │   │       ├── start.sh
    │       │   │       └── state.js
    │       │   ├── remove-ignored-artifacts.js
    │       │   ├── set-max-old-space-size.sh
    │       │   ├── solhint-custom
    │       │   │   ├── index.js
    │       │   │   └── package.json
    │       │   ├── update-docs-branch.js
    │       │   └── upgradeable
    │       │       ├── README.md
    │       │       ├── patch-apply.sh
    │       │       ├── patch-save.sh
    │       │       ├── transpile-onto.sh
    │       │       ├── transpile.sh
    │       │       └── upgradeable.patch
    │       ├── slither.config.json
    │       ├── solhint.config.js
    │       └── test
    │           ├── TESTING.md
    │           ├── access
    │           │   ├── AccessControl.behavior.js
    │           │   ├── AccessControl.test.js
    │           │   ├── Ownable.test.js
    │           │   ├── Ownable2Step.test.js
    │           │   ├── extensions
    │           │   │   ├── AccessControlDefaultAdminRules.test.js
    │           │   │   └── AccessControlEnumerable.test.js
    │           │   └── manager
    │           │       ├── AccessManaged.test.js
    │           │       ├── AccessManager.behavior.js
    │           │       ├── AccessManager.predicate.js
    │           │       ├── AccessManager.test.js
    │           │       └── AuthorityUtils.test.js
    │           ├── account
    │           │   └── utils
    │           │       ├── draft-ERC4337Utils.test.js
    │           │       ├── draft-ERC7579Utils.t.sol
    │           │       └── draft-ERC7579Utils.test.js
    │           ├── bin
    │           │   ├── EntryPoint070.abi
    │           │   ├── EntryPoint070.bytecode
    │           │   ├── EntryPoint080.abi
    │           │   ├── EntryPoint080.bytecode
    │           │   ├── SenderCreator070.abi
    │           │   ├── SenderCreator070.bytecode
    │           │   ├── SenderCreator080.abi
    │           │   └── SenderCreator080.bytecode
    │           ├── finance
    │           │   ├── VestingWallet.behavior.js
    │           │   ├── VestingWallet.test.js
    │           │   └── VestingWalletCliff.test.js
    │           ├── governance
    │           │   ├── Governor.t.sol
    │           │   ├── Governor.test.js
    │           │   ├── TimelockController.test.js
    │           │   ├── extensions
    │           │   │   ├── GovernorCountingFractional.test.js
    │           │   │   ├── GovernorCountingOverridable.test.js
    │           │   │   ├── GovernorERC721.test.js
    │           │   │   ├── GovernorPreventLateQuorum.test.js
    │           │   │   ├── GovernorProposalGuardian.test.js
    │           │   │   ├── GovernorSequentialProposalId.test.js
    │           │   │   ├── GovernorStorage.test.js
    │           │   │   ├── GovernorSuperQuorum.test.js
    │           │   │   ├── GovernorSuperQuorumGreaterThanQuorum.t.sol
    │           │   │   ├── GovernorTimelockAccess.test.js
    │           │   │   ├── GovernorTimelockCompound.test.js
    │           │   │   ├── GovernorTimelockControl.test.js
    │           │   │   ├── GovernorVotesQuorumFraction.test.js
    │           │   │   ├── GovernorVotesSuperQuorumFraction.test.js
    │           │   │   └── GovernorWithParams.test.js
    │           │   └── utils
    │           │       ├── ERC6372.behavior.js
    │           │       ├── Votes.behavior.js
    │           │       ├── Votes.test.js
    │           │       └── VotesExtended.test.js
    │           ├── helpers
    │           │   ├── access-manager.js
    │           │   ├── account.js
    │           │   ├── chains.js
    │           │   ├── constants.js
    │           │   ├── deploy.js
    │           │   ├── eip712-types.js
    │           │   ├── eip712.js
    │           │   ├── enums.js
    │           │   ├── erc4337.js
    │           │   ├── erc7579.js
    │           │   ├── governance.js
    │           │   ├── iterate.js
    │           │   ├── math.js
    │           │   ├── methods.js
    │           │   ├── precompiles.js
    │           │   ├── random.js
    │           │   ├── storage.js
    │           │   ├── strings.js
    │           │   ├── time.js
    │           │   └── txpool.js
    │           ├── metatx
    │           │   ├── ERC2771Context.test.js
    │           │   ├── ERC2771Forwarder.t.sol
    │           │   └── ERC2771Forwarder.test.js
    │           ├── proxy
    │           │   ├── Clones.behaviour.js
    │           │   ├── Clones.t.sol
    │           │   ├── Clones.test.js
    │           │   ├── ERC1967
    │           │   │   ├── ERC1967Proxy.test.js
    │           │   │   └── ERC1967Utils.test.js
    │           │   ├── Proxy.behaviour.js
    │           │   ├── beacon
    │           │   │   ├── BeaconProxy.test.js
    │           │   │   └── UpgradeableBeacon.test.js
    │           │   ├── transparent
    │           │   │   ├── ProxyAdmin.test.js
    │           │   │   ├── TransparentUpgradeableProxy.behaviour.js
    │           │   │   └── TransparentUpgradeableProxy.test.js
    │           │   └── utils
    │           │       ├── Initializable.test.js
    │           │       └── UUPSUpgradeable.test.js
    │           ├── sanity.test.js
    │           ├── token
    │           │   ├── ERC1155
    │           │   │   ├── ERC1155.behavior.js
    │           │   │   ├── ERC1155.test.js
    │           │   │   ├── extensions
    │           │   │   │   ├── ERC1155Burnable.test.js
    │           │   │   │   ├── ERC1155Pausable.test.js
    │           │   │   │   ├── ERC1155Supply.test.js
    │           │   │   │   └── ERC1155URIStorage.test.js
    │           │   │   └── utils
    │           │   │       ├── ERC1155Holder.test.js
    │           │   │       └── ERC1155Utils.test.js
    │           │   ├── ERC20
    │           │   │   ├── ERC20.behavior.js
    │           │   │   ├── ERC20.test.js
    │           │   │   ├── extensions
    │           │   │   │   ├── ERC1363.test.js
    │           │   │   │   ├── ERC20Burnable.test.js
    │           │   │   │   ├── ERC20Capped.test.js
    │           │   │   │   ├── ERC20FlashMint.test.js
    │           │   │   │   ├── ERC20Pausable.test.js
    │           │   │   │   ├── ERC20Permit.test.js
    │           │   │   │   ├── ERC20Votes.test.js
    │           │   │   │   ├── ERC20Wrapper.test.js
    │           │   │   │   ├── ERC4626.t.sol
    │           │   │   │   ├── ERC4626.test.js
    │           │   │   │   └── draft-ERC20TemporaryApproval.test.js
    │           │   │   └── utils
    │           │   │       └── SafeERC20.test.js
    │           │   ├── ERC6909
    │           │   │   ├── ERC6909.behavior.js
    │           │   │   ├── ERC6909.test.js
    │           │   │   └── extensions
    │           │   │       ├── ERC6909ContentURI.test.js
    │           │   │       ├── ERC6909Metadata.test.js
    │           │   │       └── ERC6909TokenSupply.test.js
    │           │   ├── ERC721
    │           │   │   ├── ERC721.behavior.js
    │           │   │   ├── ERC721.test.js
    │           │   │   ├── ERC721Enumerable.test.js
    │           │   │   ├── extensions
    │           │   │   │   ├── ERC721Burnable.test.js
    │           │   │   │   ├── ERC721Consecutive.t.sol
    │           │   │   │   ├── ERC721Consecutive.test.js
    │           │   │   │   ├── ERC721Pausable.test.js
    │           │   │   │   ├── ERC721Royalty.test.js
    │           │   │   │   ├── ERC721URIStorage.test.js
    │           │   │   │   ├── ERC721Votes.test.js
    │           │   │   │   └── ERC721Wrapper.test.js
    │           │   │   └── utils
    │           │   │       ├── ERC721Holder.test.js
    │           │   │       └── ERC721Utils.test.js
    │           │   └── common
    │           │       └── ERC2981.behavior.js
    │           └── utils
    │               ├── Address.test.js
    │               ├── Arrays.t.sol
    │               ├── Arrays.test.js
    │               ├── Base64.t.sol
    │               ├── Base64.test.js
    │               ├── Bytes.test.js
    │               ├── CAIP.test.js
    │               ├── Calldata.test.js
    │               ├── Context.behavior.js
    │               ├── Context.test.js
    │               ├── Create2.t.sol
    │               ├── Create2.test.js
    │               ├── Multicall.test.js
    │               ├── Nonces.behavior.js
    │               ├── Nonces.test.js
    │               ├── NoncesKeyed.test.js
    │               ├── Packing.t.sol
    │               ├── Packing.test.js
    │               ├── Panic.test.js
    │               ├── Pausable.test.js
    │               ├── ReentrancyGuard.test.js
    │               ├── ShortStrings.t.sol
    │               ├── ShortStrings.test.js
    │               ├── SlotDerivation.t.sol
    │               ├── SlotDerivation.test.js
    │               ├── StorageSlot.test.js
    │               ├── Strings.t.sol
    │               ├── Strings.test.js
    │               ├── TransientSlot.test.js
    │               ├── cryptography
    │               │   ├── ECDSA.test.js
    │               │   ├── EIP712.test.js
    │               │   ├── MerkleProof.test.js
    │               │   ├── MessageHashUtils.t.sol
    │               │   ├── MessageHashUtils.test.js
    │               │   ├── P256.t.sol
    │               │   ├── P256.test.js
    │               │   ├── RSA.helper.js
    │               │   ├── RSA.test.js
    │               │   ├── SigVer15_186-3.rsp
    │               │   ├── SignatureChecker.test.js
    │               │   └── ecdsa_secp256r1_sha256_p1363_test.json
    │               ├── introspection
    │               │   ├── ERC165.test.js
    │               │   ├── ERC165Checker.test.js
    │               │   └── SupportsInterface.behavior.js
    │               ├── math
    │               │   ├── Math.t.sol
    │               │   ├── Math.test.js
    │               │   ├── SafeCast.test.js
    │               │   ├── SignedMath.t.sol
    │               │   └── SignedMath.test.js
    │               ├── structs
    │               │   ├── BitMap.test.js
    │               │   ├── Checkpoints.t.sol
    │               │   ├── Checkpoints.test.js
    │               │   ├── CircularBuffer.test.js
    │               │   ├── DoubleEndedQueue.test.js
    │               │   ├── EnumerableMap.behavior.js
    │               │   ├── EnumerableMap.test.js
    │               │   ├── EnumerableSet.behavior.js
    │               │   ├── EnumerableSet.test.js
    │               │   ├── Heap.t.sol
    │               │   ├── Heap.test.js
    │               │   └── MerkleTree.test.js
    │               └── types
    │                   └── Time.test.js
    ├── out
    │   ├── Base.sol
    │   │   ├── CommonBase.json
    │   │   ├── ScriptBase.json
    │   │   └── TestBase.json
    │   ├── Context.sol
    │   │   └── Context.json
    │   ├── Counter.t.sol
    │   │   └── Challenge.json
    │   ├── CurvePool.sol
    │   │   └── CurvePool.json
    │   ├── CurveToken.sol
    │   │   └── CurveToken.json
    │   ├── ERC20.sol
    │   │   └── ERC20.json
    │   ├── IERC20.sol
    │   │   └── IERC20.json
    │   ├── IERC20Metadata.sol
    │   │   └── IERC20Metadata.json
    │   ├── IERC3156.sol
    │   │   ├── IERC3156FlashBorrower.json
    │   │   └── IERC3156FlashLender.json
    │   ├── ILendingPool.sol
    │   │   └── ILendingPool.json
    │   ├── IMulticall3.sol
    │   │   └── IMulticall3.json
    │   ├── IWETH.sol
    │   │   └── IWETH.json
    │   ├── MetaPoolToken.sol
    │   │   └── MetaPoolToken.json
    │   ├── ReentrancyGuard.sol
    │   │   └── ReentrancyGuard.json
    │   ├── StdAssertions.sol
    │   │   └── StdAssertions.json
    │   ├── StdChains.sol
    │   │   └── StdChains.json
    │   ├── StdCheats.sol
    │   │   ├── StdCheats.json
    │   │   └── StdCheatsSafe.json
    │   ├── StdConstants.sol
    │   │   └── StdConstants.json
    │   ├── StdError.sol
    │   │   └── stdError.json
    │   ├── StdInvariant.sol
    │   │   └── StdInvariant.json
    │   ├── StdJson.sol
    │   │   └── stdJson.json
    │   ├── StdMath.sol
    │   │   └── stdMath.json
    │   ├── StdStorage.sol
    │   │   ├── stdStorage.json
    │   │   └── stdStorageSafe.json
    │   ├── StdStyle.sol
    │   │   └── StdStyle.json
    │   ├── StdToml.sol
    │   │   └── stdToml.json
    │   ├── StdUtils.sol
    │   │   └── StdUtils.json
    │   ├── Test.sol
    │   │   └── Test.json
    │   ├── Vm.sol
    │   │   ├── Vm.json
    │   │   └── VmSafe.json
    │   ├── build-info
    │   │   ├── 36fd25f8951113e4.json
    │   │   └── 6c72852e0e8692c5.json
    │   ├── console.sol
    │   │   └── console.json
    │   ├── draft-IERC6093.sol
    │   │   ├── IERC1155Errors.json
    │   │   ├── IERC20Errors.json
    │   │   └── IERC721Errors.json
    │   └── safeconsole.sol
    │       └── safeconsole.json
    ├── remappings.txt
    ├── script
    │   └── Counter.s.sol
    ├── src
    │   ├── CurvePool.sol
    │   ├── CurveToken.sol
    │   ├── MetaPoolToken.sol
    │   └── interfaces
    │       ├── IERC3156.sol
    │       ├── ILendingPool.sol
    │       └── IWETH.sol
    └── test
        └── Counter.t.sol
        ```