//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.5.0 < 0.9.0;

/*
Destructuring Assignments and Solidity Tricks
Solidity functions can return multiple variables of different types
If you only want to keep one variable. then you can decalre a variable and then use commas
*/

contract DestructuringFunctions {
    uint public changeValue;
    string public tom = "Hello World";

    function f() public pure returns(uint, bool, string memory) {
        return (3, true, "Goodbye");
    }

    function g() public {
        (changeValue,,tom) = f();
    }
}