//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
The contract allows only its creator to create new coins (different issuance schemes are possible)
Anyone can send coins to each other without a need for registering with a username and password, all you need is an Ethereum keypair
*/

contract RobinsonCoin {
    //The keyword "public" makes variables accessible from other contracts
    address public minter;
    mapping(address => uint) public balance;

    //Events allow clients to react to specific contract changes you declare
    event Sent(address from, address to, uint money);

    //Errors allow you to provide information about why an operation failed. They are returned to the called of the function
    error insufficientBalance(uint requested, uint available);

    //Constructor code is only run when the contract is deployed
    constructor() {
        minter = msg.sender;
    }

    //Sends an amount of newly created coins to an address and can only be called by the contract creator
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balance[receiver] += amount;
    }

    //Sends an amount of existing coins from any caller to an address
    function send(address receiver, uint amount) public {
        if(amount > balance[msg.sender]) {
            revert insufficientBalance({requested: amount, available: balance[msg.sender]});
        }

        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}