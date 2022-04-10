

import '../models/movie.dart';

class SearchMovie{
  const SearchMovie();

}

class SearchMovieSuccesful{
  const SearchMovieSuccesful(this.movies);
 final List<Movie> movies;
}

class SearchMovieError{
  const SearchMovieError(this.error);

  final dynamic error;
}