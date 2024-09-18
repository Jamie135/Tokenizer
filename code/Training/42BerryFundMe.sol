// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract BerryFundMe {
    
    uint256 public minBerry = 50;

    function fund() public payable {
        require(msg.value >= minBerry, "Not enough!");
    }

    function getPrice() public {
        // ABI
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
    }

    function getVersion() public view returns (uint256) {
        
    }

    function getConversionRate() public {

    }
}