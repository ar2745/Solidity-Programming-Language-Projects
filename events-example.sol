//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
Event Example:
Abstraction - Decentralized Exchange: On a smart contract traders can trade tokens - from the smart contract emit on an event so they can get the data (web front mobile)
After emitting events you can't read them in the past only for entities outside the of the blockchain - not stored ad memory events have lower gas const than storage
*/

contract LearnEvents {
    // Delcare the event
    // Indexed allow the consumer to filter out this data but at a higher gas cost
    // Only use 3 indexed per event 
    event NewTrade(uint indexed date, address from, address indexed to, uint indexed amount);
    
    function trade(address to, uint amount) external {
        // Outside consumer can see the event through web3js
        // block.timestamp is a global variable that gives the current timestamp 
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }
}