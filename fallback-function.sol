//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Define Fallback Functions:
1. Cannot have a name
2. Does not take any inputs
3. Does not return any outputs
4. Must be declared as external

Why use it? When you call functions that does not exist - or send ether to a contract by send, transfer or call statement:
Example: Send and transfer method receives 2300 gas but call method receives more (all of the gas)
Not recommended to write much code in the fallback function - becasuse the function will fail if it uses too much gas 
*/

contract FallBack {
    event Log(uint gas);

    fallback() external payable {
        emit Log(gasleft());
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallBack(address payable _to) public payable {
        _to.transfer(msg.value);
    } 

    function callFallBack(address payable _to) public payable {
        (bool sent,) = _to.call{value:msg.value}("");
        require(sent, "Failed to send!");
    }
}
