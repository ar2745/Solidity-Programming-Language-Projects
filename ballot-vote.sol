//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// Making a voting contract

// 1. We want the ability to accept proposals and store them 
// Proposal: their name, number

// 2. Voters & voting ability
// Keep track of voting
// Check voters are authenticated to vote

// 3. Chairman
// Authenticate and deploy contract

contract Ballot {
    struct Proposal {
        string name; // The name of each proposal
        uint voteCount; // Number of accummulated votes        
    }

    struct Voters {
        bool voted;
        uint accessToVote;
        uint voteIndex;
    }

    Proposal [] public proposals;
    mapping(address => Voters) public voters;
    address public chairman;

    constructor(string [] memory proposalNames) {
        chairman = msg.sender;
        voters[chairman].accessToVote = 1;

        for(uint i = 0; i < proposals.length; i++) {
            proposals.push(Proposal({name: proposalNames[i], voteCount: 0}));
        }
    }

    // Function authentication votes
    function giveRightToVote(address voter) public {
        require(msg.sender == chairman, "Only the Chairman can give access to vote");
        require(!voters[voter].voted, "This voter has already voted");
        require(voters[voter].accessToVote == 0, "This voter already has access to vote");

        voters[voter].accessToVote = 1;
    } 

    // Function for voting
    function vote(uint proposal) public {
        Voters storage sender = voters[msg.sender];

        require(sender.accessToVote != 0, "This voter has no access to vote");
        require(!sender.voted, "Already voted");

        sender.voted = true;
        sender.voteIndex = proposal;

        proposals[proposal].voteCount += sender.accessToVote; 
    }

    // Functions for showing the results    
    // Function that shows the winning proposal by interger
    function winningProposal() public view returns(uint winningProposal_) {
        uint winningVoteCount = 0;

        for(uint i = 0; i < proposals.length; i++) {
            if(proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposal_ = i;
            }
        } 
    }         
    // Function that shows the winner by name
    function winningName() public view returns(string memory winningName_) {
        winningName_ = proposals[winningProposal()].name;
    } 
}