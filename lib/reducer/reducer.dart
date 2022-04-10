

import 'package:temeflutter/actions/movie_search.dart';
import 'package:temeflutter/models/app_state.dart';
import 'package:temeflutter/data/movie_api.dart';

AppState reducer(AppState state, dynamic action){
   final AppStateBuilder builder = state.toBuilder();

   if(action is SearchMovie){
     builder.isLoading=true;
   }else if(action is SearchMovieSuccesful){
     builder.isLoading = false;
     builder.movies.addAll(action.movies);
   }else if(action is SearchMovieError){
     builder.isLoading = false;
   }

   return builder.build();

}