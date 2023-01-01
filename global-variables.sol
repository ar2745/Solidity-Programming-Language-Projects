//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Special variables (global variables) are globally available variables and provides information about the blockchain
Example:
msg.sender: Sender of the message (current call)
msg.value (uint): Number of wei sent with the message
block.timestamp: Current block tiemstamp as seconds dince unix epoch
block.number (uint): Current block number

Global Variables Excercise Practice:
1. Create a new contract called Updater
2. Create a public function called updatesBalance
3. Instantiate the data type contract LedgerBalance to a new variable called ledgerbalance (similar to struct or enum)
4. Set the new variable ledgerbalance = new LedgerBalance()
5. Update the ledgerbalance to 30
7. Deploy both contracts and then update the ledgerbalance by 30 using the Updater contract 
*/

contract LedgerBalance {
    // Create a map of wallets with amounts
    // Set up a function that can update the amount of the person who calls the contract - current address - msg.sender
    mapping(address => uint) balance;

    function updateBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }
}

contract Updater {
    function updatesBalance() public {
        LedgerBalance ledgerbalance = new LedgerBalance();
        ledgerbalance.updateBalance(30); 
    }
}

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        // storedData = x;
        // storedData = block.difficulty;
        // storedData = block.timestamp;
        storedData = block.number;
    } 

    function get() public view returns(uint) {
        return storedData;
    }
}