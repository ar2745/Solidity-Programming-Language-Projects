//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Solidity supports String literal using both double quote (") and single quote (')
It provides string as a data type to declare a variable of type String

Strings: Values that are made up of ordered sequences of characters, such as "Hello World"
A string can contain any sequence of characters, visible or invisible, and characters may be repeated

Memory: Much like RAM, memory in in Solidity is a temporary place to store data whereas Storage holds data between function calls
Solidity Smart Contract can use any amount of memory during the execution but once the execution stops, the memory is completely wiped off for the next execution

Bytes: Strings are too expensive computationally to get length in Solidity so you can't do it like any other language
Instead convert it with stringToBytes method and then return it  

Excercise with strings:
1, Create a string called favoriteColor
2. Set the favorite color to your favorite color
3. Create a function which returns the string literal of favoriteColor
4. Create a function which changes the favoriteColor string literal from to another of your favorite color
5. Create a function which can return how many characters there are in the string favoriteColor 
*/

contract learnStrings {
    string greetings = "Hello World";
    string favoriteColor = "Red";

    function sayHelloWorld() public view returns(string memory) {
        return greetings;
    }

    function changeGreetings(string memory _change) public {
        greetings = _change;
    }

    function getCharacters() public view returns(uint) {
        bytes memory stringToBytes = bytes(greetings);
        return stringToBytes.length;
    }

    function getFavoriteColor() public view returns(string memory) {
        return favoriteColor;
    }

    function changeFavoriteColor(string memory _change) public {
        favoriteColor = _change;
    }

    function bytesFavoriteColor() public view returns(uint) {
        bytes memory stringToBytes = bytes(favoriteColor);
        return stringToBytes.length;
    }
}
