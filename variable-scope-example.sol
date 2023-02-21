//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.5.0 < 0.9.0;

/*
Variable Scope - Functions & Variables

Public = You can call the function from outside the smart contract as well as inside the smart contract
Private = You can only call the function inside the contract
Internal = You can only call the function within the contract OR other contracts that inherit the smart contract and Internal is slightly less restrictive than public 
External = You can only call the function outside the contract not from other functions

How to decide which one to use?
RULE OF THUMB: Give the minimum amount of privilege to any entity.
1. Private, 2. Internal, 3. External 4. Public

Modify the rules of scope in Solidity with keywords
*/

contract A {
    uint public x = 10;
    uint y = 20;
    uint internal z = 10;
    
    function getX1() private view returns(uint) {
        return x;
    }

    function getX2() public view returns(uint) {
        uint a;
        a = getX1();
        return a;
    }

    function getX3() internal view returns(uint) {
        return x;
    }

    function getX4() external view returns(uint) {
        return x;
    }

    function getX5() public pure returns(uint) {
        uint b;
        // b = getX4(); getX4() is external and is not able to be called because it is also pure and it can not read nor write to the blockchain
        return b;
    }

    function getY() public view returns(uint) {
        return y;
    }

    function getZ() public view returns(uint) {
        return z;
    }

    function getNewZ() public pure returns(uint) {
        uint newZ = 25;
        return newZ;
    }    
}

contract B is A {
    uint public xx = getX3();
    // uint public yy = getX1(); getX1() is private and cannot be called from a derived contract
}

contract C {
    A public contract_a = new A();
    uint public xx = contract_a.getX4();
    // uint public y = contract_a.getX1(); getX1() is private and cannot be called from a derived contract
    // uint public yy = contract_a.getX3(); getX3() is internal and cannot be called from outside the contract unless it is inherited from the original contract
}
