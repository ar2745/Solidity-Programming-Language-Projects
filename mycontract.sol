//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Property {
    uint public price;
    address public owner;
    string public location = "New Jersey";
    bool public sold;

    constructor(uint _price, string memory _location, bool _sold) {
        price = _price;
        owner = msg.sender;
        location = _location;
        sold = _sold;
    }

    //Function Modifier
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    } 

    function changeOwner(address _owner) public onlyOwner {
        owner = _owner;
    }

    function setPrice(uint _price) public {
        price = _price;
    }

    function setLocation(string memory _location) public {
        location = _location;
    }

    function getPrice() view public returns(uint) {
        return price;
    } 
    
    // Event
    event OwnerChanged(address owner);
}