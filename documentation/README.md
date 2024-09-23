# 42Berry (42B)

## Overview

### Web3.0

Web 3.0 is a decentralized network that represents the next phase of the internet (Web 2.0). Unlike  its predecessors, Web 3.0 prioritizes user privacy and data ownership through blockchain and smart contracts, enabling direct interactions without middlemen. This approach aims to improve security, transparency, and trust in online activities, opening doors for new applications and services.

### Cryptocurrency and Cryptography

- Cryptocurrency is a type virtual currency that that relies on cryptography for security. Unlike traditional currencies, cryptocurrencies exist only in digital form and have no physical counterpart.  
- Cryptography is the process of securing communication and data from unauthorized access, using complex mathematical algorithms for the encryption, making it almost impossible to decipher.

### Token

The type of cryptocurrency that will be studied in this project is a Token.
Unlike coins (e.g. Bitcoin, Ethereum) that operate on their own independent blockchain, Tokens use an existing blockchain to perform their wide-range functionalities that are managed by a smart contract.
Coins are primarily used as a medium of exchange, data storage, or transaction payment. Whereas Tokens represent a variety of assets or utilities, such as digital assets, access to platform-specific services, or even voting rights within a decentralized application (dApp).

### Smart Contracts

Smart contracts are self-executing contracts with the terms of the agreement directly written into code. These contracts are hosted on a blockchain and are automatically executed when predefined conditions are met. Smart contracts play a pivotal role in decentralized applications (dApps) and advanced functionalities, requiring robust blockchains capable of handling complex computations and data.

### Blockchain

Blockchain is a type of distributed database designed to record, store, and transmit data securely across a decentralized network. It removes the need for a central authority by allowing participants (nodes) to manage and verify data collectively. The data is stored in “blocks” that are linked together in a chronological order, forming a continuous “chain,” which makes the entire system resistant to modification and tampering.

#### How does it work

- **Transaction Creation**: A transaction is initiated by a user (e.g., sending cryptocurrency, executing a smart contract, or storing data). This transaction is broadcast to the network.

- **Verification**: Nodes (computers on the network) verify the transaction using a consensus mechanism, ensuring that the data is valid and complies with the rules of the blockchain.

- **Block Creation**: Once verified, the transaction is bundled together with others into a "block." The block is then added to the chain in chronological order.

- **Consensus Mechanism**: The network reaches consensus on the validity of the block, depending on the type of blockchain, either through PoW, PoS, or other mechanisms. This process ensures that the blockchain remains consistent across all nodes.

- **Finalization**: Once consensus is reached, the new block is added to the chain, and the ledger is updated across all participants in the network.

## Contract Overview

**42Berry (42B)** is an ERC20-compliant token built on the Ethereum blockchain using OpenZeppelin libraries. This token includes standard ERC20 features such as name, symbol or balance querying, while also offering advanced functionalities like account contract pausing, minting and burning tokens. These features provide additional flexibility and security for managing the token's operations.

### Key Features

- **Minting:** The contract owner can mint new tokens.
- **Burning:** The contract owner can burn existing tokens. 
- **Pausing:** The owner can pause all token transfers.

## Contract Structure

### Imports

The contract uses OpenZeppelin libraries to ensure security, reliability, and simplicity:

- **ERC20**: Provides the standard ERC20 functionality for fungible tokens.
- **Ownable**: Allows for ownership management, restricting certain functions to the owner of the contract.
- **Pausable**: Adds the ability to pause and unpause the contract, temporarily disabling certain actions (like token transfers).

### Constructor

The contract's constructor initializes the ERC20 token with:
- **Name**: "42Berry"
- **Symbol**: "42B"
- The contract owner is set during deployment using the `Ownable`, which restricts certain actions to the owner's address.

```solidity
constructor(0xAddressOwner)
    ERC20("42Berry", "42B")
    Ownable(0xAddressOwner)
{}
```

### Functions

#### Mint

This function allows the contract owner to mint (create) new tokens and assign them to a specified address. Only the owner can mint tokens due to the owner modifier.

```solidity
mint(0xAddress, amount)
```

**Parameters**:
- **account**: The address that will receive the newly minted tokens.
- **amount**: The number of tokens to be created. The function multiplies this by 10^18 to account for the token's 18 decimal places.

#### Burn

This function allows the contract owner to burn (destroy) a specified amount of tokens from a specified address. Only the owner can burn tokens due to the owner modifier.

```solidity
burn(0xAddress, amount)
```

**Parameters**:
- **account**: The address from which the tokens will be burned.
- **amount**: The number of tokens to be burned. The function multiplies this by 10^18 to account for the token's 18 decimal places.

#### Pause

This function allows the contract owner to pause the contract, which stops all token transfers. When the contract is paused, no tokens can be transferred or minted, which
can be useful in case of security breach or if an issue is identified.

```solidity
pause()
```

#### Unpause

This function unpauses the contract, resuming all token transfers and other paused functions. After calling this function, the contract exits the paused state, and normal operations can continue.

```solidity
unpause()
```

---

## Additional Resources

- [Contract Etherscan](https://sepolia.etherscan.io/address/0xC341Ae4d736087338a7B24F326a8A031DD4Cf00f)

- [Blockchain Demo](https://andersbrownworth.com/blockchain/)

- [Ethereum Converter](https://eth-converter.com/)

- [OpenZeppelin Library](https://docs.openzeppelin.com/contracts/5.x/api/token/erc20#ERC20)

## Sepolia Faucets

- [Chainlink](https://faucets.chain.link/sepolia)
