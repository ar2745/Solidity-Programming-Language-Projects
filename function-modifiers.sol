//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Functions modifiers are used to modify the bahaviour of a function
Function modifiers are customizable modifications for functions
For example to add a prerequisite to a function

Function Modifiers Excersise Practice
1. Create a function modifier called costs for our register function that chcks to see that the senders value (hint: look up msg.value) has to be greater than or equal to the price (hint: the function modifier should take an argment)
*/

contract Owner {
    address owner;

    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier costs(uint price) {
        require(msg.value >= price);
        _;
    }
}

contract Register is Owner {
    mapping(address => bool) registeredAddresses;
    uint price;

    constructor(uint initialPrice) {
        price = initialPrice;
    }

    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }

    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}