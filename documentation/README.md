# BerryToken (42B) - ERC20 Smart Contract

## Overview

**BerryToken (42B)** is an ERC20-compliant token built on the Ethereum blockchain using OpenZeppelin libraries. This token includes standard ERC20 features such as minting, transferring, and balance querying, while also offering advanced functionalities like account contract pausing, minting and burning tokens. These features provide additional flexibility and security for managing the token's operations.

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
- The contract owner is set during deployment using the `Ownable(owner)` mechanism, which restricts certain actions to the owner's address.

```solidity
constructor(address owner)
    ERC20("42Berry", "42B")
    Ownable(owner)
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

More information about other functions from OpenZeppelin library: [OpenZeppelin](https://docs.openzeppelin.com/contracts/5.x/api/token/erc20#ERC20)
