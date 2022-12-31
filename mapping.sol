pragma solidity >= 0.7.0 < 0.9.0;

/*
Mapping is a reference type as arrays and structs
Following is the syntax to declare a mapping type
Mapping allows you to save data and add a key that you specify and then retrieve that info later
Similar to struct or an array - it is a reference type
In Solidity you can't iterate through a map - you need to store the keys in an array and you can't give a size
You can get, set and delete a value from a mapping though

Nested Mapping (map within maps)
What if you wanted to store movies that belong to a certain person, thing or address ****very important****
Another example - allow one address to spend on behalf of another address (ERC20 tokens)
ex: (mapping(key => mapping(key2 => value2)) nestedMap

Mapping Excercise Practice:
1. Deploy the mapping contract
2. Create some keys as addresses and set those keys to unique values
3. Remove all the addresses and check to see their updated value

Mapping Assignment:
1. Create a unique data type as a struct called Movie and give it the string properties: title and director
2. Create a map called movie which takes a uint as a key and Moview as a value
3. Create a function called addMovie which takes three inputs, movieId, title, and director which assigns a value of an integer to a movie added back to the movie map and it should include a title and director name
4 Deploy the contract and update the movie information to the movie map with our favorite movies! 
*/

contract learnMapping {
    mapping(address => uint) public myMap;

    function setAddress(address _address, uint _i) public {
        myMap[_address] = _i;
    } 

    function getAddress(address _address) public view returns(uint){
        return myMap[_address];
    }

    function removeAddress(address _address) public {
        delete myMap[_address];
    }
}

contract mappingAssignment {
    struct Movie {
        string title;
        string director;        
    }

    mapping(uint => Movie) public movie;

    function addMovie(uint id, string memory title, string memory director) public {
        movie[id] = Movie(title, director);
    }
}

contract nestedMapping {
    mapping(uint => Movie) public movie;
    mapping(address => mapping(uint => Movie)) public myMovie;

    struct Movie {
        string title;
        string director;
    }

    function addMovie(uint id, string memory title, string memory director) public {
        movie[id] = Movie(title, director); 
    }

    // Msg.sender is a global variable accessible throughout Solidity which captures the address that is calling the contract
    function addMyMovie(uint id, string memory title, string memory director) public {
        myMovie[msg.sender][id] = Movie(title, director);
    }
} 
