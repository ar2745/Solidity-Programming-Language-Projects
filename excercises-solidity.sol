//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// A contract in the sense of Solidity is a collection of code (its functions) and data *its state) that resides at a specific address on the Ethereum blockchain 
contract simpleStorage {
    uint storeData = 34;
    string names = "Andrew";
    bool switchOn = true;

    /* 
       A function is a group of reusable code that can be used anywhere in your application 
       They perform a specific task  
       The most common way to define a function in Solidity is by using the function keywoord, followed by a unique function name, a list of parameters (that might be empty) and a statement block surrounded by curly brackets
    */

    function setData(uint x) public {
        storeData = x;
    } 

    function setNames(string memory name) public {
        names = name;
    }

    function getData() public view returns(uint) {
        return storeData;
    }

    function getName() public view returns(string memory) {
        return names;
    }
}