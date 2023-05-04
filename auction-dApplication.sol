//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
It is time to test your skills and the knowledge you have gained going through this course from start to finish!

Your mission is to write a decentralized auction dApplication which can at the minimum have the following functionality
As long as you meet the minimum required functionality then you have passed this course, however should you choose to exceed the minimum and continue to expand upon the Auction then you are truly becoming a defi super star and I would love to see what you come up with so please share it in the discord!

If you fall short - do not worry, take your time, ask questions in our Discord, do some research, and go as far as you can
When you are ready go to the solution video and we can go through it all together as always

Final Excercise: Create an Auction dApplication (The Decentralized Ebay)

1. You must create a contract called Auction which contains state vairables to keep track of the beneficiary (auctioneer), the highest bidder, the auction end time and the highest bid
2. There must be events set up which can emit whenever the highest bid changes both address and amount and an event for the auction ending emitting the winner address and amount
3. The contract must be deployed set to the beneficiary address and how long the auction will run for
4. There should be a bid function which includes at the minimum the following:
    a. Revert the call if the bidding period is over
    b. If the bid is not higher, send the money back
    c. Emit the highes bid has increased
5. Bearing in mind the withdrawal pattern, there should be a withdrawal function to return bids based on the library of keys and values
6. There should be a function which ends the auction and sends the highest bid to the beneficiary!
7. Good luck!
*/

contract Auction {
    address payable public beneficiary;
    address public highestBidder;
    uint public auctionEndTime;
    uint public highestBid;
    bool ended;

    event highestBidIncrease(address bidder, uint amount);
    event auctionEnding(address winner, uint amount);

    mapping(address => uint) pendingReturns;

    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() public payable {
        if(block.timestamp > auctionEndTime) {
            revert("The auction has ended");
        }

        if(msg.value <= highestBid) {
            revert("The bid is not high enough");
        }

        if(highestBid != 0) {
            pendingReturns[highestBidder] += highestBid; 
        }

        highestBidder = msg.sender;
        highestBid = msg.value;

        emit highestBidIncrease(msg.sender, msg.value);
    }

    function withdraw() public payable returns(bool) {
        uint amount = pendingReturns[msg.sender];

        if(amount > 0) {
            pendingReturns[msg.sender] = 0;
        }

        if(!payable(msg.sender).send(amount)) {
            pendingReturns[msg.sender] = amount;
        }

        return true;
    }

    function auctionEnd() public {
        if(block.timestamp < auctionEndTime) {
            revert("The auction has not ended!");
        }

        if(ended) {
            revert("The auction has ended!");
        }

        ended = true;

        emit auctionEnding(highestBidder, highestBid);
        beneficiary.transfer(highestBid);
    }
}