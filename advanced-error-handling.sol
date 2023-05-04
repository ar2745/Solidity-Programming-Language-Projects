//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
Error Handling
Solidity has functions that help with error handling
A way of tackling this is that when an error happens, the state reverts back to its original stat
Below are some of the important methods for error handling:

assert(bool condition) - In case condition is not met, this method call causes an invalid opcode and any changes done to state got reverted
This method is to be used for internal errors

require(bool condition) - In case condition is not met, this method call reverts to original state
This method is to be used for errors in input or external components

require(bool condition, string memory message) - In case condition si not met, this method call reverts to original state
This method is to eb used for errors in inputs or external components
It provides an option to provide a custom message

revert() - This method aborts the execution and revert any changes done to the state

revert(string memory reason) - This method aborts the execution and revert any changes done to the state
It provides an option to provide a custom message

Error Handling Excercise Practice:
1. Create a contract called Vendor with the state variable adress seller
    It should contain a modifier onlySeller that requires the msg.sender to be the selelr
2. Add a function becomeSeller which sets the seller to the msg.sender
3. Create a function named sell which is payable and check to see 
    If an input of an amount is greater than msg.value to revert that there is not enough ether provided as an throw error
*/

contract LearnErrorHandling {
    bool public sunny = true;
    bool public umbrella = false;
    uint finalCalculation = 0;

    function solarCalculation() public {
        require(sunny, "It is not sunny today");
        finalCalculation += 3;
        assert(finalCalculation != 6);
    }

    function internalTestUnits() public view {
        assert(finalCalculation != 6);
    }

    function weatherChanger() public {
        sunny = !sunny;
    }

    function getCalculation() public view returns(uint) {
        return finalCalculation;
    }
    
    function bringUmbrella() public {
        if(!sunny) {
            umbrella = true;
        }
        else {
            revert("No need to bring an umbrella today!");
        }
    }
}


contract Vendor {
    address seller;

    modifier onlySeller {
        require(msg.sender == seller);
        _;
    }

    function becomeSeller() public {
        seller = msg.sender;
    } 

    function sell(uint num1) payable public onlySeller {
        if(num1 > msg.value) {
            revert("There is not enough ether provided");
        } 
    }
}