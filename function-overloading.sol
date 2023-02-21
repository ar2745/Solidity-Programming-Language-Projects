//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Function Overloading:
You can have multiple definitions for the same function name in the same scope
The definition of the function must differ frome ach other by the types and/or the number of arguments in the argument list
You cannot overload function declarations that differ only by return type

Function Overloading Excercise Practice:
1. Create two functions with the same name that return the sum of their arguments - one function which takes two arguments and another function which takes three arguments
2. Create two other functions which can call each sum function and return their various sums
3. Successfully deploy your contract and test the results of overloading functions!
*/

contract FunctionOverloading {
    function getSum(uint num1, uint num2) public pure returns(uint) {
        return num1 + num2;
    }

    function getSum(uint num1, uint num2, uint num3) public pure returns(uint) {
        return num1 + num2 + num3;
    }

    function callGetSumTwoArgs() public pure returns(uint) {
        return getSum(2,2);
    }

    function callGetSumThreeArgs() public pure returns(uint) {
        return getSum(2,3,4);
    }
}