//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
Inheritance!
Inheritance is a way to extend functionality of a contract
Solidity supports both single as well as multiple inheritance
Following are the key highlights:
Observe: The contract in Solidity is similar to a Class in C++ - a blueprint for an object
Classes can inherit and so can contracts!
Constructor - A special function declared with constructor keyword which will be executed once per contract and is invoked when a contract is created

Advanced Inheritance Excercise Practice
1. Create two contracts A and B
2. Contract A should hvae a state variable called innerVal initialized to 100
3. Create a fully accessible function called innerAddTen which returns 10 to any given input
3. Contract B should inherit from contract A
4. Contract B should have a function called outerAddTen which returns the calculation from innerAddTen function in contract A to any given input
5. Create a function in contract B which returns the value of innerVal from contract A
*/

contract A {
    uint innerVal = 100;

    function innerAddTen(uint num1) public pure returns(uint) {
        return num1 + 10;
    } 
}

contract B is A {
    function outerAddTen(uint num2) public pure returns(uint) {
        return innerAddTen(num2);
    } 

    function getInnerVal() public view returns(uint) {
        return innerVal;
    }
}