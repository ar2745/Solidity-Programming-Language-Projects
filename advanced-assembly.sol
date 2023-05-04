//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
Solidity provides an option to use assembly language tow rite inline assembly within Solidity source code
Assembly is a low level language that allows you to directly manipulate the EVM (more dangerous and not recommnded)
EVM = smart contracts are not the real code in the blockchain - solidity code is compiled to a lower level language

Advanced Assembly Excercise Practice:
The function addToEVM3 is attempting to convert data bytes
It wants to convert using Solidity a data byte into a fixed bytes size
However, if you run the code the way it is it will not compile successfully becasue explicitly type conversions are not allowed from bytes memory to bytes32

Use assembly and the mload to convert the data to bytes32 successfully 
Hint: Bytes in memory size starts at secon slot so we need to bring in the add 32 to start at the correct position
*/

contract LearnAssembly {
    function addToEVM() external {
        uint x;
        uint y;
        //uint z = x + y;
    
    assembly {
        let z := add(x, y)
        let a := mload(0x40)
        mstore(a,4)
        sstore(a,100)
    }
    }

    function addToEVM2() public view returns(bool success) {
        uint size;
        address addr;

        assembly {
            size := extcodesize(addr) 
        }

        if(size > 0) {
            return true;
        }
        else {
            return false;
        }
    }

    function addToEVM3() external pure {
        bytes memory data = new bytes(12);
        //bytes memory dataB32 = bytes32(data);
        
        assembly {
            let a := mload(add(data, 32))
        }
    }
} 