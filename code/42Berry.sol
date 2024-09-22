// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract BerryToken is ERC20, Ownable, Pausable {

    constructor(address initialOwner)
        ERC20("42Berry", "42B")
        Ownable(initialOwner)
    {}

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount * 10 ** decimals());
    }

    function burn(address account, uint256 amount) public onlyOwner {
        _burn(account, amount * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }
}
