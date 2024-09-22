# BerryToken (42B) - ERC20 Smart Contract

## Overview

**BerryToken (42B)** is an ERC20-compliant token built on the Ethereum blockchain using OpenZeppelin libraries. This token includes standard ERC20 features such as minting, transferring, and balance querying, while also offering advanced functionalities like account freezing, contract pausing, and minting new tokens. These features provide additional flexibility and security for managing the token's operations.

### Key Features

- **Minting:** The contract owner can mint new tokens.
- **Pausing:** The owner can pause all token transfers.
- **Account Freezing:** The owner can freeze and unfreeze specific accounts, preventing transfers from or to those addresses.
- **Security:** Token transfers can be restricted by pausing the contract or freezing specific accounts.

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
- The contract owner is set during deployment using the `Ownable(owner)` mechanism, which restricts certain actions to the owner's address.

```solidity
constructor(address owner)
    ERC20("42Berry", "42B")
    Ownable(owner)
{}
