// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";
import "@openzeppelin/contracts@5.0.2/security/Pausable.sol";

contract BerryToken is ERC20, Ownable, Pausable {
    mapping(address => bool) private _frozenAccounts;

    /**
     * @dev Constructor that initializes the ERC20 token with a name and symbol,
     * and sets the initial owner of the contract.
     * @param owner The address that will be set as the initial owner of the contract.
     */
    constructor(address owner)
        ERC20("42Berry", "42B")
        Ownable(owner)
    {}

    /**
     * @dev Function to mint new tokens.
     * Can only be called by the owner of the contract.
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * 10 ** decimals()); // Calls the internal _mint function to create new tokens and assign them to the 'to' address.
    }

    /**
     * @dev Function to pause the contract.
     * Can only be called by the owner of the contract.
     */
    function pause() public onlyOwner {
        _pause(); // Calls the internal _pause function to pause the contract.
    }

    /**
     * @dev Function to unpause the contract.
     * Can only be called by the owner of the contract.
     */
    function unpause() public onlyOwner {
        _unpause(); // Calls the internal _unpause function to unpause the contract.
    }

    /**
     * @dev Function to freeze an account.
     * Can only be called by the owner of the contract.
     * @param account The address to freeze.
     */
    function freezeAccount(address account) public onlyOwner {
        _frozenAccounts[account] = true;
    }

    /**
     * @dev Function to unfreeze an account.
     * Can only be called by the owner of the contract.
     * @param account The address to unfreeze.
     */
    function unfreezeAccount(address account) public onlyOwner {
        _frozenAccounts[account] = false;
    }

    /**
     * @dev Overrides the _beforeTokenTransfer function to include checks for paused state and frozen accounts.
     * This ensures that token transfers are only allowed when the contract is not paused and the accounts are not frozen.
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        require(!_frozenAccounts[from], "ERC20: account is frozen");
        require(!_frozenAccounts[to], "ERC20: account is frozen");
        super._beforeTokenTransfer(from, to, amount);
    }
}
