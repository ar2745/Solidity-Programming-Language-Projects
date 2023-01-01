//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Loops allow you to iterate through data and take functional action depending on the data
A "For" loop is used to repeat a specific block of code a known number of times
For example, if we want to check the grade of every student in the class, we loop from 1 to that number

Looping Practice:
1. Create a contract myLoopingPracticeContract and place all the following code within:
2. Create a list that ranges from 1 to 30 called longlist
3. Create a list called numbersList of the followng numbers: 1, 4, 34, 56
4. Create a function that loops through numbersList and returns a true value if the number that the user inputs exists in the list otherwise it should return false
5. Create a function that loops through and returns how many even numbers there are in the long list 
*/

contract loopContract {
    uint [] private numbersList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    function checkMultiples(uint num1, uint num2) public pure returns(bool) {
        if(num1 % num2 == 0) {
            return true;
        }
        else {
            return false;
        }
    }

    function multipleChecker(uint num1) public view returns(uint) {
        uint count = 0;

        for(uint i = 0; i < numbersList.length; i++) {
            if(checkMultiples(numbersList[i], num1)) {
                count++;
            }                                
        }
        return count;
    } 
}

contract myLoopingPracticeContract {
    uint [] longList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
    uint [] numbersList = [1, 4, 34, 56];

    function loopNumbersList(uint num1) public view returns(bool) {
        bool numberExists = false;

        for(uint i = 0; i < numbersList.length; i++) {
            if(i == num1) {
                numberExists = true;
            }                      
        }     
        return numberExists;   
    } 

    function loopLongList() public view returns(uint) {
        uint count = 0;

        for(uint i = 0; i < longList.length; i++) {                        
            if(i % 2 == 0) {
                count++;              
            }           
        }
        return count;
    }
}