// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Define a new contract called `CrossGuild`, which inherits from ERC20 and Ownable
contract CrossGuild is ERC20, Ownable {

    uint256 initialSupply = 10000;

    // Constructor that initializes the token with the name "42Berry", symbol "42B"
    // It sets the initial amount of tokens to 1 million
    // It also sets the sender address to be the owner of the contract
    constructor() ERC20("42Berry", "42B") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    // Function to mint new tokens for the targeted address
    function increaseBounty(address account, string memory rank, uint256 tier) public onlyOwner {
        require(account != owner(), "Cannot increase bounty for the owner");
        require(tier >= 1 && tier <= 5, "Invalid tier");

        uint256 amount = calculateAmount(rank, tier);
        require(balanceOf(account) + amount * 10 ** decimals() <= 5000 * 10 ** decimals(), "Account bounty too high");
        _mint(account, amount * 10 ** decimals());
    }

    // Function to burn tokens for the targeted address
    function decreaseBounty(address account, string memory rank, uint256 tier) public onlyOwner {
        require(account != owner(), "Cannot decrease bounty for the owner");
        require(tier >= 1 && tier <= 5, "Invalid tier");

        uint256 amount = calculateAmount(rank, tier);
        require(balanceOf(account) >= amount * 10 ** decimals(), "Account bounty too low");
        _burn(account, amount * 10 ** decimals());
    }

    // Function to transfer tokens from the contract owner to the bounty claimer's address
    function claimBounty(address claimer, address captured) public onlyOwner {
        require(claimer != owner() && captured != owner(), "The owner cannot claim or be captured");
        require(totalSupply() >= balanceOf(captured), "Insufficient total supply");

        _transfer(msg.sender, claimer, balanceOf(captured));
        _burn(captured, balanceOf(captured));
    }

    // Function to mint tokens for the contract owner
    function negotiateHostage() public onlyOwner {
        uint256 currentSupply = initialSupply * 10 ** decimals();
        require(currentSupply > balanceOf(msg.sender), "No bounty has been claimed yet!");
        uint256 amount = currentSupply - balanceOf(msg.sender) + (100 * 10 ** decimals());
        _mint(msg.sender, amount);
        initialSupply = balanceOf(msg.sender) / (10 ** decimals());
    }

    // Function to calculate the token amount
    function calculateAmount(string memory rank, uint256 tier) internal pure returns (uint256) {
        uint256 baseAmount = 0;
        if (keccak256(abi.encodePacked(rank)) == keccak256(abi.encodePacked("star"))) {
            baseAmount = 100;
        } else if (keccak256(abi.encodePacked(rank)) == keccak256(abi.encodePacked("crown"))) {
            baseAmount = 1000;
        }
        return baseAmount * tier;
    }
}
