pragma solidity >= 0.7.0 < 0.9.0;

contract WelcomeToSolidity{
    constructor() public{
    }

    //Adding two integers
    function getResult() public view returns(uint){
        uint a = 7;
        uint b = 8;
        uint result = a + b;
        return result;
    }
}
