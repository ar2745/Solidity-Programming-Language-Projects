//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
What are arrays? :)
Array is a data structure, which stores a fixed-size sequential collection of elements of the same type
An array is sued to store a collection of data but it is often more useful to think of an array as a collection of variabes of the same type

1. How to write an array
2. pop, push, and length emthods
3. remove elements from an array

Array Excercise:
1. Create an empty array called changeArray 
2. Create a function called removeElement which sets the index argument of the array to the last elemetn in the array
3. Remove the last index from that function witht eh pop method
4. Create a function called test which pushed 1, 2, 3, 4 into changeArray
5. Remove the element 2 from the array when the contract is called 
*/

contract learnArrays {
    uint [] public myArray1;
    uint [] public myArray2;
    uint [200] public myFixedSizeArray3;
    uint [] public changeArray;

    // The push() method adds one or more elements to the end of an array and returns the new length of the array

    function push(uint number) public {
        myArray1.push(number);
    }

    // The pop() method removes the last element from an array and returns that value to the caller 
    function pop() public {
        myArray1.pop();
    }

    // The length() method is a string property that is used to determine the length of a string
    function getLength() public view returns(uint) {
        return myArray1.length;
    }

    function getArray() public view returns(uint [] memory) {
        return myArray1;
    }

    function remove(uint i) public {
        delete myArray1[i];
    } 

    function removeElement(uint i) public {
        changeArray[i] = changeArray[changeArray.length -1];
        changeArray.pop();
    }

    function test() public {
        for(uint i = 1; i <= 4; i++) {
            changeArray.push(i);
        }        
    }
    
    function removeCertainElement() public {
        for(uint i = 0; i < changeArray.length; i++) {
            if(i == 2) {
                delete changeArray[i];
            }
        }
    }
    
    function getChangeArray() public view returns (uint [] memory) {
        return changeArray;
    }    
} 
