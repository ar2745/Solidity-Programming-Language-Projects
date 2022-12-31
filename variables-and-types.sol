pragma solidity >= 0.7.0 < 0.9.0;

// Variables: Variables are used to store information to be refrenced and manipulated in a computer program.
// Types: Three main types of variables: Boolean, Integer, & String 
// Boolean - Keyword: bool - Value: true/false
// Integer - Keyword - uint - Value: signed and unsigned integers of varying sizes
// String - Keyword - string - Value: data values that are made up of ordered sequences of characters
// lieDetector = boolean to check whether waht they say is true or false
// walletAmount = integer that would hold the amount
// errorMessageText = string that would say "Error! There has been a mistake! :("

contract learnVariables {
    uint chocolateBar = 12;
    uint storeOwner = 347;
    bool lieDetector = true;
    string errorMessageText = "Error! There has been a mistake! :("; 

}

// Excercise Practice: 
// 1. Create a new variable called wallet as an integer
// 2. Create a boolean called spend
// 3. Create a string and give it the name notifySpend
// 4. Initialize the wallet to 527
// 5. Set the value of spend to false
// 6. Add the string literal (the string value) "You have spent money" to notifySpend

contract excercisePractice {
    uint wallet = 527;
    bool spend = false;
    string notifySpend = "You have spent money";    
}