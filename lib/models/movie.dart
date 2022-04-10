
library movie;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:temeflutter/models/serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie,MovieBuilder>{
  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;


  factory Movie.fromJson(dynamic json) {
     serializers.deserializeWith(serializer, json);

     return Movie.fromJson(json);
  }

  Movie._();

  String get title;
  int get year;
  num get rating;
  int get runtime;
  BuiltList<String> get genres;
  String get summary;

  @BuiltValueField(wireName: 'background_image')
  String get backgroundImage;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get mediumCoverImage;

  @BuiltValueField(wireName: 'large+cover_image')
  String get largeCoverImage;

  static Serializer<Movie> get serializer => _$movieSerializer;
}