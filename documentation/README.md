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

More information about OpenZeppelin: [OpenZeppelin](https://docs.openzeppelin.com/contracts/5.x/api/token/erc20#ERC20)

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
- **to**: The address that will receive the newly minted tokens.
- **amount**: The number of tokens to be created. The function multiplies this by 10^18 to account for the token's 18 decimal places.

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

#### Freeze

This function allows the owner to freeze a specific account, preventing it from sending or receiving tokens. A frozen account is essentially locked from making any transactions involving the token.

**Parameters**:
- **account**: The address of the account that will be frozen.

```solidity
freezeAccount(0xAddress)
```

#### Unfreeze

This function allows the owner to unfreeze a previously frozen account, enabling it to resume token transfers.

**Parameters**:
- **account**: The address of the account that will be unfrozen.

```solidity
unfreezeAccount(0xAddress)
```

#### Check

This is an internal function that is overridden to add additional checks before any token transfer takes place. It ensures:
- The contract is not paused (whenNotPaused).
- Neither the sender (from) nor the receiver (to) has a frozen account.

**Parameters**:
- **from**: The address sending the tokens.
- **to**: The address receiving the tokens.
- **amount**: The amount of tokens being transferred.

```solidity
_checkTransfer(0xSender, 0xReciever, amount)
```

If any of these conditions are violated, the transaction will revert with an error message:
- Error when paused: The contract will throw an error if it is in a paused state.
- Error for frozen accounts: The contract will throw an error if either the sender's or receiver's account is frozen.
