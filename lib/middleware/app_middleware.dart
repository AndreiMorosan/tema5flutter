


import 'package:redux/redux.dart';
import 'package:temeflutter/actions/movie_search.dart';
import 'package:temeflutter/data/movie_api.dart';
import 'package:temeflutter/models/app_state.dart';
import 'package:temeflutter/models/movie.dart';

class AppMiddleware{
  const AppMiddleware({required MovieApi searchMovie})
  :assert(searchMovie != null),
  _searchMovie = searchMovie;


  final MovieApi _searchMovie;

  List<Middleware<AppState>> get middleware{
    return <Middleware<AppState>>[
      _getMovies,
    ];
  }

  Future<void> _getMovies(Store store , dynamic action, NextDispatcher next) async {
    next(action);
    try {
      if (action is SearchMovie) {
        final List<Movie> movies = await _searchMovie.getMovies();

        final SearchMovieSuccesful searchMovieSuccesful = SearchMovieSuccesful(
            movies);

        store.dispatch(searchMovieSuccesful);
      }
    }catch(e){
      final SearchMovieError searchMovieError = SearchMovieError(e);

      store.dispatch(searchMovieError);
    }
  }
}