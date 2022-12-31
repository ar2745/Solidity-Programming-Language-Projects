pragma solidity >= 0.7.0 < 0.9.0;

/*
Enums restrict a variable to have one of only a few predefined values
The values in this enumerated list are called enums
With the use of enums it is possible to reduce the number of bugs in your code

Enums Practice:
1. Create an enum for shirtcolor called shirtColor and set it to the options of either RED or WHITE or GREEN
2. Create a data of shirtColor called defaultChoice which is a constant set to the color BLUE
3. Create a data of shirtColor called choice and don't initiate the value
4. Create a function called setWhite which changes the shirt color of shirt color to white
5. Create a function called getChoice which returns the current choice of shirtColor
6. Create a function getDefaultChoice which returns the default choice of shirtColor
*/

contract enumsLearn {
    enum frenchFriesSize {LARGE, MEDIUM, SMALL}
    frenchFriesSize choice;
    frenchFriesSize constant defaultChoice = frenchFriesSize.MEDIUM;

    function setSmall() public {
        choice = frenchFriesSize.SMALL;
    }

    function getChoice() public view returns(frenchFriesSize) {
        return choice;
    }

    function getDefaultChoice() public view returns(uint) {
        return uint(defaultChoice);
    } 
} 

contract enumsExcercisePractice {
    enum shirtColor {RED, WHITE, GREEN, BLUE}
    shirtColor constant defaultChoice = shirtColor.BLUE;
    shirtColor choice;

    function setWhite() public {
        choice  = shirtColor.WHITE;
    }

    function getChoice() public view returns(shirtColor) {
        return choice;
    }

    function getDefaultChoice() public view returns(shirtColor) {
        return defaultChoice;
    }
}