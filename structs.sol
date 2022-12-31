pragma solidity >= 0.7.0 < 0.9.0;

/* 
Struct types are used to represent a record
Suppose you want to keep track of your movies in a library
You might want to track the following attributes about each movie

Structs Excercise Practice:
1. Create a new movie and set it up so that it updates to the movie in the setMovie function
2. Return the id of the new movie 
*/

contract learnStructs {
    struct Movie {
        string title;
        string director;
        uint movieId;
    }

    Movie movie;

    function setMovie() public {
        movie = Movie("Blade Runner", "Ridley Scott", 1);
    }

    function getMovieId() public view returns(uint) {
        return movie.movieId;
    }
}

contract structsExcercisePractice {
    struct Movie {
        string title;
        string director;
        uint movieId;
    }

    Movie movie;

    function setMovie() public {
        movie = Movie("Bad Boys", "Michael Bay", 1);
    }

    function getMovieName() public view returns(string memory) {
        return movie.title;
    }

    function getMovieDirector() public view returns(string memory) {
        return movie.director;
    }

    function getMovieId() public view returns(uint) {
        return movie.movieId;
    }
}
