import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filme_flix_bruno.rodrigues/app_config.dart';
import 'package:filme_flix_bruno.rodrigues/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MovieRepository {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      headers: {'Authorization': 'Bearer ${AppConfig.instance.token}'},
      queryParameters: {'language': 'pt-BR'},
    ),
  );

  SharedPreferences? _preferences;

  final String moviesKey = 'movies';

  FutureOr<SharedPreferences> get db async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future<List<Movie>> getMovies() async {
    final response = await client.get(
      '/discover/movie',
      queryParameters: {'page': 1},
    );

    final movies =
        (response.data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();

    final storage = await db;

    // Corrige a serialização para JSON
    storage.setStringList(
      moviesKey,
      movies.map((m) => jsonEncode(m.toJson)).toList(),
    );

    return movies;
  }

  Future<List<Movie>> getMoviesDb() async {
    final storage = await db;
    final movies = storage.getStringList(moviesKey);
    if (movies == null || movies.isEmpty) {
      return [];
    }
    return movies.map((m) => Movie.fromJson(jsonDecode(m))).toList();
  }
}
