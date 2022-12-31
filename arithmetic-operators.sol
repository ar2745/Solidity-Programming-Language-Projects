pragma solidity >= 0.7.0 < 0.9.0;

/*
OPERATORS

An operator in a programming language is a symbol that tells the compiler 
or interpreter to eprform specific mathematical, relational or logical operation and produce a final result.

Arithmetic Operators: + - % * / -- ++

Comparison Operators: < > == != <= >= 

Logical Operators: && || !

Bitwise Operators: & | ^

Variable Operands: a, b, c, d, i, x, y etc.   

Assignment Operators: =

Excercise Practice:
Create a function that finds the remainder of 3 % 4
increment and decrement

Final Operators Excercise:
1. Create a contract called FinalExcercise
2. Initialize 3 state variable a, b, f
3. Assign each variable the following: a = 300, b = 12, f = 47
4. Create a function called finalize that is public and viewable which returns a local variable d
5. Initialize d to 23
6. Return d n short handed assignment form to multiply itself by itself and then subtracted by b
7. Bonus: Make the function conditional so that it will only return the multiplication if a is greater than or eqaul to b and b is less than f otherwise d should return itself       
*/

contract ArithmeticOperators {
    function calculator() public pure returns(uint) {
        uint a = 7;
        uint b = 5;
        uint result = a + b;
        return result;
    } 

    function arithmeticExcercise1() public pure returns(uint) {
        uint a = 2;
        uint b = 12;
        return a + b - b + a;              
    }

    function arithmeticExcercise2() public pure returns(uint) {
        uint a = 2;
        uint b = 12;
        return a * b * b - 1;
    }

    function arithmeticExcercise3() public pure returns(uint) {
        uint a = 2;
        uint b = 12;
        return b + b++ + a++;
    }

    function arithmeticExcercise4() public pure returns(uint) {
        uint a = 2;
        uint b = 12;
        return (b % a) + 3;
    }
}

contract ComparisonOperators {
    uint a = 5;
    uint b = 7;

    function compareLess() public view {
        require(a < b, "That is false");
    }

    function compareMore() public view {
        require(a > b, "That is false");
    }

    function compareEqual() public view {
        require(a == b, "That is false");
    }

    function compareNotEqual() public view {
        require(a != b, "That is false");
    }

    function compareLessOrEqual() public view {
        require(a <= b, "That is false");
    }
} 

contract LogicalOperators {
    uint a = 7;
    uint b = 5;

    function logicAnd() public view returns(uint) {
        uint result = 0;

        if(a > b && a == 7) {
            result = a + b;
            return result;
        }
        else {
            return result;
        }
    }

    function logicOr() public view returns(uint) {
        uint result = 0;

        if(a > b || a == 7) {
            result = a + b;
            return result;
        }
        else {
            return result;
        }
    }

    function logicNot() public view returns(uint) {
        uint result = 0;

        if(!(a > b)) {
            result = a + b;
            return result;
        }
        else {
            return result;
        }
    }

    function logicalOperatorExcercise() public pure returns(uint) {
        uint c = 17;
        uint d = 32;
        uint result = (c * d) / d;

        if(d > c && c != d) {
            return result;
        }
    } 
}

contract AssignmentOperator {
    uint a = 4;
    uint b = 3;

    function assign() public view returns(uint) {
        uint c = 2;
        //return c = c + c + b;//}
                             /////} These two assignment operator equations will result in the same answer      
        return c += c + b;   ////}
    }
} 

contract FinalExcercise {
    uint a = 300;
    uint b = 12;
    uint f = 47;

    function finalize() public view returns(uint) {
        uint d = 23;

        if(a >= b && b < f) {
            return (d * d) - b;
        }
        else {
            return d;
        }
    }
}

