//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
Abstract contracts

Abstract contract is one which contains at least one function without any implementation
Such a contract is used as a base contract
Generally an abstract contract contains both implemented as well as abstact functions
Derived contract will implement the abstract function and use the existing functions as and when required

Abstract Contract Excercise Practice:
1. Create an abstract base contract called Calculator with a read only public function that returns integers
2  Create a derived contract called Test which derives the Calcuator contract and can calculate 1 + 2 and return the result
*/

contract baseContract {
    function helloWorld1() public pure returns(string memory) {
        return "Hello World";
    }
}

contract derivedContract is baseContract {
    function helloWorld() public view virtual returns(string memory) {
        return "Hello World";
    }
}

abstract contract abstractContract is derivedContract {
    function helloWorld() public override pure returns(string memory) {
        return "Hello World";
    }
}

// Technically contract is still abstract since it has at least one function without a body
contract Member {
    string name;
    uint age = 38;

    // Because function setName has no body the contract is now abstract
    function setName() public virtual returns(string memory) {}

    function returnAge() public view returns(uint) {
        return age;
    } 
} 

// Derived contract
contract Teacher is Member {
    function setName() public override pure returns(string memory) {
        return "Gordon";
    } 
}

//Excercise Practice
contract Calculator {
    function calculate() public virtual returns(uint) {}
}

contract Test is Calculator {
    function calculate() public override pure returns(uint) {
        return 1 + 2;
    }
}