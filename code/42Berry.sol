// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

// Define a new contract called `WorldGovt`, which inherits from ERC20, Ownable, and Pausable
contract WorldGovt is ERC20, Ownable, Pausable {

    // Constructor that initializes the token with the name "42Berry" and symbol "42B"
    // It also sets the passed address to be the owner of the contract using Ownable
    constructor(address initialOwner)
        ERC20("42Berry", "42B")
        Ownable(initialOwner)
    {}

    // Function to mint new tokens, only accessible by the owner of the contract
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount * 10 ** decimals());
    }

    // Function to burn tokens, only accessible by the owner of the contract
    function burn(address account, uint256 amount) public onlyOwner {
        _burn(account, amount * 10 ** decimals());
    }

    // Function to pause the contract, only accessible by the owner of the contract
    // Pausing the contract will allow the owner to prevent all transfers and approvals
    function pause() public onlyOwner {
        _pause();
    }

    // Function to unpause the contract, only accessible by the owner of the contract
    // It allows the owner to restore full functionality of the contract
    function unpause() public onlyOwner {
        _unpause();
    }
}
