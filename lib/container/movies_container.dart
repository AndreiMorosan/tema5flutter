


import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:temeflutter/models/app_state.dart';
import 'package:temeflutter/models/movie.dart';
import 'package:meta/meta.dart';


class MoviesContainer extends StatelessWidget {
  const MoviesContainer({Key? key,required this.builder}) : super(key: key);
   final ViewModelBuilder<BuiltList<Movie>> builder;
  @override
  Widget build(BuildContext context) {
    return StoreConnector(builder: builder,
        converter: (Store<AppState> store){
         return store.state.movies;
        }

    );
  }
}
