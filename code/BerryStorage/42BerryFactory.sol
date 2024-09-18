// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "./42Berry.sol";

contract BerryFactory {

    Berry[] public berryArray;

    function createBerryContract() public {
        Berry berry = new Berry();
        berryArray.push(berry);
    }

    function storeBerry(uint256 _berryIndex, uint256 _bounty) public {
        berryArray[_berryIndex].store(_bounty);
    }

    function getBerry(uint256 _berryIndex) public view returns(uint256) {
        return berryArray[_berryIndex].retrieve();
    } 
}