import 'dart:convert';
import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/repositories_interface/local_movies_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie_model.dart';



@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPreferences prefs;
  static const cachedKey = "cached_available_movies";

  HomeLocalDataSourceImpl(this.prefs);

  @override
  Future<void> cacheAvailableMovies(List<Movie> movies) async {
    final models = movies
        .map((e) => MovieModel(
              id: e.id,
              title: e.title,
              image: e.image,
              rating: e.rating.toDouble(),
              // genres: e.genres,
            ))
        .toList();

    final encoded = models.map((m) => m.toJson()).toList();
    await prefs.setString(cachedKey, jsonEncode(encoded));
  }

  @override
  Future<List<Movie>> getCachedAvailableMovies() async {
    final jsonString = prefs.getString(cachedKey);
    if (jsonString == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((m) => MovieModel.fromJson(m).toEntity()).toList();
  }
}
