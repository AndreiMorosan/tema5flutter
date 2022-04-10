

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:temeflutter/container/is_loading_container.dart';
import 'package:temeflutter/container/movies_container.dart';
import 'package:temeflutter/models/app_state.dart';
import 'package:temeflutter/models/movie.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);
  
   String title;
   
  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).state.isLoading;
    StoreProvider.of<AppState>(context).state.movies;
    
    return LoadingContainer(
      builder: (BuildContext context, bool isLoading) {

        return Scaffold(
            appBar: AppBar(

              title: Text(title),
            ),
            body: Builder(
              builder: (BuildContext context) {
                if (isLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else {
                  return MoviesContainer(
                     builder: (BuildContext context, BuiltList<Movie> movies){
                      return GridView.builder(
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 3,
                           mainAxisSpacing: 4.0,
                           crossAxisSpacing: 4.0,
                         ),
                         itemCount: movies.length,
                         itemBuilder: (BuildContext context, int index) {
                           final Movie movie = movies[index];

                           return GridTile(
                             child: Image.network(movie.mediumCoverImage),
                             footer: GridTileBar(
                               title: Text(movie.title),
                               subtitle: Text(movie.genres.join(', ')),
                             ),
                           );
                         },
                       );
                     }
                  );
                }
              },
            )
        );

      }
    );
  }
}

