//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.5.0 < 0.9.0;

/*
Variable Scope - Functions & Variables

Public = You can call the function from outside the smart contract as well as inside the smart contract
Private = You can only call the function inside the contract
Internal = You can only call the function within the contract OR other contracts that inherit the smart contract
Internal is slightly less restrictive than public 
External = You can only call the function outside the contract not from other functions

How to decide which one to use?
RULE OF THUMB: Give th minimum amount of privilege to any entity.
1. Private, 2. Internal, 3. External 4. Public

Modify the rules of scope in Solidity with keywords
*/

contract C {
    uint internal data = 10;

    function x() public pure returns(uint) {
        uint newData = 25;
        return newData;
    }

    function y() public view returns(uint) {
        return data;
    }
}
