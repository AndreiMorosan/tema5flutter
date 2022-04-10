

import 'dart:convert';


import 'package:http/http.dart';
import 'package:temeflutter/models/movie.dart';

class MovieApi{
  const MovieApi({required Client client}):assert(client != null),
  _client = client;

  final Client _client;

  Future<List<Movie>> getMovies() async{

    const String url = 'https://yts.mx/api/v2/list_movies.json?limit=50';

    final Response response = await get(Uri.parse(url));

    final String body = response.body;

    List<dynamic> json = jsonDecode(body)['data']['movies'];

    return json.map((dynamic json) => Movie.fromJson(json)).toList();

  }

}