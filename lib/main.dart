import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:temeflutter/data/movie_api.dart';
import 'package:temeflutter/middleware/app_middleware.dart';
import 'package:temeflutter/models/app_state.dart';
import 'package:temeflutter/models/movie.dart';
import 'package:temeflutter/presentation/home_page.dart';
import 'package:temeflutter/reducer/reducer.dart';

import 'actions/movie_search.dart';

void main() {
  final Client client = Client();
  final api = MovieApi(client: client);
  final middleware = AppMiddleware(searchMovie: api);
  final AppState initialState = AppState.initiate();
  final Store<AppState> store = Store<AppState>(reducer,
  initialState: initialState,
  middleware: middleware.middleware);

   store.dispatch( const SearchMovie());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,required this.store}) : super(key: key);

   final Store<AppState> store;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store:store,
      child: MaterialApp(
        title: 'TEMA5',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'TEMA 5'),
      ),
    );
  }
}


