//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Functions:

A function is a group of reusabe code which can be called anywhere in your program.
This eliminates the need of writing the same code again and again.
It helps programmers in writing modular codes. 
Functions allow a programmer to divide a big program into a number of small and manageable functions.  

Like any other advanced programming language, Solidity also supports all the features necessary to wirte modular code using functions.
This section explains how to write your own functions in Solidity.

Psuedocode:

door - variable (stored information)
remoteControlOpen - open the door - function
remoteControlClose - close the door - function 

Structure:

function-name(parameter) scope returns() {
    statements
    }

Excercise Practice:

1. Create a function in the learnFunctions contract called multiplyCalculator
2. Add two parameters to the function (a & b) and set them as integers.
3. Grant the function public visibility as well as viewing.
4. Return an integer for the function.
5. Create a variable result that contains the logic to multiply a and b.
6. Return the result.
7. Compile and deploy your very first dApplication and test out the results!!
*/

contract learnFunctions {
    // Create a function that can add up two variables
    function addValues() public view returns(uint) {
        uint a = 2;
        uint b = 2;
        uint result = a + b;
        return result;
    }

    function addNewValues() public view returns(uint) {
        uint a = 3;
        uint b = 4;
        uint result = a + b;
        return result;
    }

    function multiplyCalculator(uint a, uint b) public view returns(uint) {
        uint result = a * b;
        return result;
    }   
    
    function divideCalculator(uint a, uint b) public view returns(uint) {
        uint result = a / b;
        return result;
    }
}