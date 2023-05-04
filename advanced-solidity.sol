//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Excercise Practice:
1. Create 3 contracts called A, B, C

2. Do the following in contract A:
    a. Create an integer state variable called data which can only be used internally and not at all in any other contract
    b. Create an integer state variable called info which can be called both inside and outside the contract
    c. Immediately initialize info's value to 10 within a constructor
    d. Create a function called increment which can only be used internally and not at all in any other contracts
       It should take an imput integer called a and be read only while returning the calculation of its input + 1
    e. Write a function called dupDateData which takes an integer aregument called a and sets data to the argument
        The function should be able to be called both inside and outside the contract
    f. Write a read only function called getData which returns value of the data and can be called both inside and outside the contract
    g. Write a read only function called compute which calculates and returns two integer arguments a + b
        The function should only be used internally orby derived contracts

3. Do the following in contract B:
    a. Derive contract A to a new variable b and set a new instance of the contract to it
    b. Write a read only function called readInfo which returns the info from contract A which can be called both inside and outside the contract 

4. Do the following in contract C:
    a. Inherit contract A into C with the special keyword is
    b. Create an integer called result which can only be used internally and not even by derived contracts
    c. Create a private variable a which inherits the contract A 
    d. Immediately set the variable a to a new instance of the contract a upon deployment with a constructor
    e. Write a function called getComputedResult which sets teh values of 23 and 5 to the compute function contract A
        The function can be used both externally and internally
    f. Create a public called read only function called getResult which returns the var result
    g. Create a read only function called getNewInfo which returns the info variable from contract A and set the function to be used both externally and internally
    h. Celebrate completing this dang long excercise because you deserve it!!!!
*/

contract A {
    uint private data;
    uint public info;

    constructor() {
        info = 10;
    }

    function increment(uint a) private pure returns(uint){
        return a + 1; 
    }

    function updateData(uint a) public {
        data = a;
    }

    function getData() public view returns(uint) {
        return data;
    }
    
    function compute(uint a, uint b) internal pure returns(uint) {
        return a + b;
    }    
}

contract B {
    A a = new A(); 

    function readInfo() public view returns(uint) {
        return a.info();
    }
}

contract C is A {
    uint private result;
    A private a;

    constructor() {
        a = new A();
    } 

    function getComputedResult() public {
        result = compute(23, 5);
    }

    function getResult() public view returns(uint) {
        return result;
    }

    function getNewInfo() public view returns(uint) {
        return a.info();
    }
}
