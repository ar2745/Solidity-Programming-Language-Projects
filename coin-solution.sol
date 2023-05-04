//SPDX-License-Identifier: GPL-3.0 
pragma solidity ^0.8.4;

contract Coin {
    // The keyword "public" makes variables
    // accessible from other contracts
    address public minter;
    mapping (address => uint) public balances;

    // Events logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain.  
    event Sent(address from, address to, uint amount);

    // Constructor to make minter msg.sender
    constructor() {
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address and can only be called by the contract creator
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    // Error to inform if an insuffiecient balance is present
    error InsufficientBalance(uint requested, uint available);

    // Sends an amount of existing coins from any caller to an address
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}