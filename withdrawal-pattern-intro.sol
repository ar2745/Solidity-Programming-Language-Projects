//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
Cybersecurity In Solidity

Withdrawal pattern ensures that direct transfer call is not made which poses a security threat
Transfers are atomic (meaning all or nothing!)

Write an iterarting function that will refund through the transfer method investors to a variable called funders back to thei wallets called contributedAmount
Add a modifier to the signature that only the owner can execute this function
The function should return a bool success

What do you think is the problem with teh returnFunds function?
1. What if the owner chickens out and does not return funds?
The owner is a single point of failure and this pattern suggests adherence to server-centric thinking - only a privileged user should be able to initiate a mass distribution of funds
2. The loop is unbound! It could very well run out of gas before allocating all the funds back
An attacker could do is just make a bunch of small contributions

Another example: We only have two investors to refund

What could go wrong?
What happens if Tatianna rejects the transfer? If Tatianna rejects the transer the function is going to fail and then John will not get paid!!!!

Thinking that all contracts and accounts want to accept funds automaticallymay be inutitive at first but it is in fact very naive and very dangerous to build your code like this

If it is more in their interest to reject funds then chances are they will reject the funds

Write a function that will return funds to two investors, john and tatianna without using  afor loop!  
Write a fallback function because a default fallback function is not payable - it will reject funds

Should we disallow contract to receive funds?

No because not all contracts will fail or are malicious - it would deter DAOs

How does a contract find out if another address is a contract?
*/

contract Refund {
    address payable [] funders;
    address payable tatiana;
    address payable john;
    uint contributedAmount;


    modifier onlyOwner {
        require(true);
        _;
    }

    fallback() external {}

    function returnFunds1() public onlyOwner returns(bool success) {
        for(uint i = 0; i < funders.length; i++) {
            funders[i].transfer(contributedAmount);
        }
        return true;
    }

    function returnFunds2() public onlyOwner returns(bool success) {
        tatiana.transfer(contributedAmount);
        john.transfer(contributedAmount);
        return true;
    }
}

contract Victim {
    function isItAContract() public view returns(bool) {
        // if there are bytes of code greater than zero then it is a contract!
        uint32 size;
        address a = msg.sender;

        // inline assembly accesses EVM 
        assembly {
            // extcodesize retrieves the size of the code
            size := extcodesize(a)
        } 
        return (size > 0);
    }
}

// If you call the address from the constuctor there are no byte codes
contract Attacker {
    bool public trickedYou;
    Victim victim;

    constructor(address _v) {
        victim = Victim(_v);
        trickedYou = !victim.isItAContract();
    }
}

/* What to do now? 
The Withdrawal Pattern

Instead of using transfer which reverts the code we can use send which returns a bool
Write a function so only the owner can send tatianna funds with the send method with logic to set up what happens if the amount is not sent to tatianna

Write a withdrawal function so that the investor can withdraw funds on their own through that functionality
Let them do it themselves!!!!

Write another function to claim refunds
Write a function caleld claimRefund which requires that the balance of the msg.sender be greater than 0 and transfer the balance to the current caller
Pseudo balance variable named balance

by the customer working directly to claim a refund with their contract address we eliminate the outside interference very greatly!

By making our transactions one at a time we greatly reduce danger to our executions. - withdrawal patterns

Withrawal Pattern Excercise Practice:
It is not safe to interact with more than one customer at a time sow rite a function to return funds using the withdrawal patter
1. Write a function called withdrawFunds that takes an amount and returns bool success in the signature
2. Require that the balance of the current caller is greater than or equal to the amount
3. Subtract the amount from the balance of the current sender
4. Transfer the amount over and return the trueness of the function 
*/

contract WithdrawalPattern {
    address payable tatiana;
    uint amount;
    mapping(address => uint) public balance;

    modifier onlyOwner {
        require(true);
        _;
    }

    function sendRefund() public onlyOwner returns(bool success) {
        if(!tatiana.send(amount)) {
        }
    }
    
    function claimRefund() payable public {
        require(balance[msg.sender] > 0);
        msg.sender.transfer(balance[msg.sender]);
    } 

    function withdrawFunds(uint amount) public returns(bool success) {
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return true;
    }
}