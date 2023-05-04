//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract CrowdFunding {
    mapping(address => uint) public contributors;
    address public admin;
    uint public numberOfContributors;
    uint public minimumContribution;
    uint public deadline; //timestamp
    uint public goal;
    uint public raisedAmount;

    //Mapping of spending requests
    //The key is the spending request number (index) - starts from zero
    //The value is a Request struct
    mapping(uint => Request) public requests;
    uint public numberOfRequests;

    //Spending Request
    struct Request {
        string description;
        address payable recipient;
        uint value;
        bool completed;
        uint numberOfVoters;
        mapping(address => bool) voters;
    }

    modifier onlyAdmin {
        require(msg.sender == admin, "Only admin can call this function");
        _; 
    }

    constructor(uint _goal, uint _deadline) {
        goal = _goal;
        deadline = block.timestamp + _deadline;
        minimumContribution = 100 wei;
        admin = msg.sender;
    }

    //Events to emit
    event ContributeEvent(address _sender, uint _value);
    event CreateRequestEvent(string _description, address _recipient, uint _value);
    event MakePaymentEvent(address _recipient, uint _value);

    function contribute() public payable {
        require(block.timestamp < deadline, "Deadline has passed");
        require(msg.value >= minimumContribution, "Minimum contribution has not been met");

        if(contributors[msg.sender] == 0) {
            numberOfContributors++; 
        } 

        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value;

        emit ContributeEvent(msg.sender, msg.value);
    }

    receive() payable external {
        contribute();
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    //A contributor can get a refund if goal was not reached within the deadline
    function getRefund() public {
        require(block.timestamp > deadline);
        require(raisedAmount < goal);
        require(contributors[msg.sender] > 0);

        address payable recipient = payable(msg.sender);
        uint value = contributors[msg.sender];

        //Resetting the value sent by the contributor to prevent reentrancy attacks and transferring the value
        contributors[msg.sender] = 0;
        recipient.transfer(value); 
        
    }

    function createRequest(string memory _description, address payable _recipient, uint _value) public onlyAdmin {
        //numRequests starts from zero
        Request storage newRequest = requests[numberOfRequests];
        numberOfRequests++;

        newRequest.description = _description;
        newRequest.recipient = _recipient;
        newRequest.value = _value;
        newRequest.completed = false;
        newRequest.numberOfVoters = 0;

        emit CreateRequestEvent(_description, _recipient, _value);
    }

    function voteRequest(uint _requestNumber) public {
        require(contributors[msg.sender] > 0, "You must be a contributor to vote");

        Request storage thisRequest = requests[_requestNumber];

        require(thisRequest.voters[msg.sender] == false, "You have already voted");
        thisRequest.voters[msg.sender] = true;
        thisRequest.numberOfVoters++;
    }

    function makePayment(uint _requestNumber) public onlyAdmin {
        require(raisedAmount >= goal);
        
        Request storage thisRequest = requests[_requestNumber];

        require(thisRequest.completed == false, "The request has been completed");
        require(thisRequest.numberOfVoters > numberOfContributors / 2);
        
        //Setting thisRequest as being completed to prevent renetrancy attacks and transfering the value
        thisRequest.completed = true;
        thisRequest.recipient.transfer(thisRequest.value);
        

        emit MakePaymentEvent(thisRequest.recipient, thisRequest.value);
    }
}