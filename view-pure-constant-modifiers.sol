//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
View functions ensure that they will not modify the state (return values)
Pure functions ensure that they will not read or modify the stat (return calculations)

View Pure Constant Modifiers Excercise Practice:
1. Create a function called multiply which returns 3 multiplied by 7
2. Create another function called valuePlusThree which returns the state variable value + 3
3. Successfully deploy the contracts and test for the results
****Remember**** to use the appropriate modifying keywords accordingly!!!!!!!
*/

contract MyContract {
    uint value;

    function setValue(uint _value) external {
        value = _value;        
    }

    function getValue() external view returns(uint) {
        return value;
    }

    function getNewValue() external pure returns(uint) {
        return 2 + 2;
    }
}

contract ExcercisePractice {
    uint value;

    function multiply() external pure returns(uint){
        return 3 * 7;        
    } 

    function valuePlusThree() external view returns(uint) {
        return value + 3;
    } 
}
