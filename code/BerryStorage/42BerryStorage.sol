// SPDX-License-Identifier: MIT
// License used to publish the contract, in our case it is only used to bypass the warning from some compiler

pragma solidity ^0.8.24;


contract Berry {
    uint256 bounty;

    mapping(string => uint256) public getBountyByName;

    struct Pirate {
        string name;
        uint256 bounty;
    }

    Pirate[] public pirate;

    function store(uint256 _bounty) public  {
        bounty = _bounty;
    }

    function retrieve() public view returns (uint256) {
        return bounty;
    }

    function addPirate(string memory _name, uint256 _bounty) public {
        pirate.push(Pirate(_name, _bounty));
        getBountyByName[_name] = _bounty;
    }
}