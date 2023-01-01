//SPDX-License-Identifier: GPL-3.0 
pragma solidity >= 0.7.0 < 0.9.0;

/*
Ether Units
Ethereum is the blockchain and Ether is the currency for Ethereum
Similar to currency, Solidity has time units where lowest unit is second and we can use seconds, minutes, hours, days and weeks as suffic to denote time

Ether Units Excercise Practice:
Create the following assertions in a function called excercise:
Assert equivalencies for minutes to seconds, hours to minutes, days to hours, and weeks to days
*/

contract learnEtherUnits {
    function test() public {
        //wei is the smallest denomination of ether

        // 10^18 wei = 1 eth
        assert(1000000000000000000 wei == 1 ether);

        // 1 wei = 1
        assert(1 wei == 1); 

        // 1 ether == 1e18 wei 
        assert(1 ether == 1e18 wei);

        // Create an assertion for 2 eths to be equivalent to weis
        assert(2 ether == 2e18 wei);  
    }

    function excercise() public {
        assert(1 minutes == 60 seconds);
        assert(1 hours == 60 minutes);
        assert(1 days == 24 hours);
        assert(1 weeks == 7 days); 
    }
}