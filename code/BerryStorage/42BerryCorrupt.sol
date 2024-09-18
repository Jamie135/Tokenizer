// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "./42Berry.sol";

contract BerryCorrupt is Berry {

    // override function
    function store(uint256 _bounty) public override {
        bounty = _bounty + 5;
    }
}