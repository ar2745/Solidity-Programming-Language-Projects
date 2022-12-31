pragma solidity >= 0.7.0 < 0.9.0;

/*
While writing a program, there may be a situation when you need to adopt one out of a given set of paths.
In such cases, you need to use conditional statements that allow your program to make correct decisions and perform right actions.

If statement: The if statement is the fundmental control statement that allows 
Solidity to make decisions and execute statements conditionally.

Else if statement: The else if statement is the next for of control statement that allows 
Solidity to execute statements in a more controlled way.
*/

/*
Excercise in DeFi! :)
1. Create a stakingWallet variable as an integer and set it to the value of 12
2. Write a function called airDrop which has the public visibility, is IDE viewable and returns an integer
3. Create decision making logic so that if the wallet has a value of greter than or equal to 10 then add to the wallet 10 more units
4. Add an else statement so that if the wallet does not equal the value of greater than or equal to 10 to add only 1 more unit
5. Return the value of the wallet
6. Deploy the contract to test the results - try changing the value of teh wallet to 7 and redeploying for varying results
*/

contract DecisionMaking {
    uint oranges = 4;
    uint stakingWallet = 12;

    function validateOranges() public view returns(bool) {
        if(oranges == 5) {
            return true;
        }
        else {
            return false;
        }
    }

    function airDrop() public view returns(uint) {
        if(stakingWallet >= 10) {
            return stakingWallet + 10;
        }
        else {
            return stakingWallet + 1;
        }        
    }
}
