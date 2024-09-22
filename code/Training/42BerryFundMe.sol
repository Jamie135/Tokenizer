// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "./PriceConverter.sol";

contract BerryFundMe {

    using PriceConverter for uint256;
    
    uint256 public minBerry = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= minBerry, "Not enough!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public {

        for(uint256 index = 0; index < funders.length; index++) {
            address funder = funders[index];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array to a blank new one
        funders = new address[](0);

        payable(msg.sender).transfer(address(this).balance);
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed");

        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Sender is not owner!");
        _;
    }
}
