//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased;
    address payable [] familyWallets;
    mapping(address => uint) inheritance;

    constructor() payable {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }
    
    // Modifier so that only the caller of the contract is the owner
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    // Modifier so that only allocate funds if elder is deceased
    modifier isDeceased {
        require(deceased == true);
        _;
    }

    // Set inheritance for each address
    function setInheritance(address payable wallet, uint amount) onlyOwner public {
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }
    
    // Pay each family member based on their wallet address
    function payout() isDeceased private {
        uint i;

        for(i = 0; i < familyWallets.length; i++) {
            familyWallets[i].transfer(inheritance[familyWallets[i]]);            
        }
    }

    // Oracle switch simulation
    function actuallyDeceased() onlyOwner public {
        deceased = true;
        payout();
    }
}