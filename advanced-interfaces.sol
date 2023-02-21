//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
Interfaces
Interfaces are similar to abstract contracts and are created using interface keyword
Following are the key characterisitcs of an interface:
Interface can not have any function with implementations
Functions of interface can be only of type external
Interface can not have constructor
Interface can not have state variables
Interface can have enum, structs which can be accessed using interface name dot notation

Excercise Interfaces with Uniswap (Decentralized Exchange)
In Uniswap each Uniswap smart contract, or pair, manages a liquidity pool made up of reserves of two ERC-20 tokens!
In this excercise you are going to use the IDE to speak to Uniswap and get the reserves of a Uniswap pair of your choosing :0

These are the instructions in order to complete this excecise:
1. Create two interfaces which each hold seperate function signatures which you must look up in the Solidity docs V2
2. One interface will be called UniswapV2Factory which will contain the function signature that gets pairs
3. Another interface will be called UniswapV2Pair which will contain the function signature to get reserve values
4. Create a contract which contains addresses of the paired tokens you choose as well as the factory address
5. Within the contract make a function which can successfully get the pair of your tokens and set it to a single address
6. Use the address to get the reserve values and finally return the reserve values
7. Switch to Mainnet and connect MetaMask but do not deploy the contract (or you will spend money!!!!)
8. From the Mainnet manually go through the steps of retrieving the values without deploying or spending gas!
9. Good luck!  
*/

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

// How do we interact with this contract without copy and pasting the code??
// Answer - Interfaces

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns(uint) {
        return ICounter(_counter).count();
    }
}

interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns(address pair); 
}

interface UniswapV2Pair {
    function getReserves() external view returns(uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract MyContract2 {
    address private factory = 0x1F98431c8aD98523631AE4a59f267346ea31F984;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private shiba = 0x95aD61b0a150d79219dCF64E1E6Cc01f0B64C4cE;
    
    function getReserveTokens() external view returns(uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, shiba);
        (uint reserve0, uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return(reserve0, reserve1);
    }
}