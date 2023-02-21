//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Restricted access to a contract is a common practice
By default, a contract state is read-only unless it is specified as public
We can restrict who can modify the contract's state or call a contract's functions using modifiers
Let us build a contract with modified restricted access with the following common writeouts:
onlyBy - only the mentioned caller can call this function
onlyAfter - called after certain time period
costs - call this function only if certain value is provided

Restricted Access Pattern Excercise Practice:
1. Create a modifier called costs which takes an argument called _amount
2. Require that msg.value is greater than or equal to the amount
3. If the msg.value is not greater than or equal to the amount then return a string that says "Not enough Ether provided!
4. Write a function called forceOwnerChange which takes an argument of an address called _newOwner and is payable
5. Add a modification to the signature so that the function needs 200 Ether to execute
6. Set the owner of the contract to the new owner of the address
7. Bonus: Figure out how to make the function actually run!
*/

contract RestrictedAccess {
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    //Write a modifier that will require the current caller to be equal to the argument _account 
    modifier onlyBy(address _account) {
        require(msg.sender == _account, "Sender not authorized!");
        _;
    }

    //Write a modifier that will require the current timestamp to be greater than the argument _time
    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time, "Function is called too early");
        _;
    }

    //Write a modifier that reuires the current value to be greate than the argument _amount
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Not enough Ether provided!");
        _;
    }

    //Write a function that will change the owner address
    function changeOwnerAddress(address newAddress) onlyBy(owner) public {
        owner = newAddress;
    }

    //Write a function that can disown the current owner and only run the function 3 weeks after the creation of the contract
    function disownOwner() onlyBy(owner) onlyAfter(creationTime + 3 weeks) public {
        delete owner;
    }

    //Write a function that forces owner change
    function forceOwnerChange(address _newOwner) costs(2 ether) payable public {
        owner = _newOwner;
    }
}