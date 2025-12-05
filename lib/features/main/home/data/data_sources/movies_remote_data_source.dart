// ignore_for_file: avoid_print

import 'package:final_route_projcet_c16/core/network/api_client.dart';
import 'package:final_route_projcet_c16/core/network/endpoints.dart';
import 'package:injectable/injectable.dart';
import '../models/movie_model.dart';


abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getMovies({
    int limit,
    int page,
    String? genre,
    String? sortBy,
    int? minRating,
    String? query,
  });
}


@LazySingleton(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final ApiClient client;

  MoviesRemoteDataSourceImpl(this.client);

  @override
  Future<List<MovieModel>> getMovies({
    int limit = 20,
    int page = 1,
    String? genre,
    String? sortBy = "date_added",
    int? minRating,
    String? query,
  }) async {
    final response = await client.get(
      Endpoints.listMovies,
      params: {
        "limit": limit,
        "page": page,
        "genre": genre,
        "sort_by": sortBy,
        "minimum_rating": minRating,
        "query_term": query,
      },
    );
     print(response.data["data"]["movies"]);
    final list = response.data["data"]["movies"] as List?;
    if (list == null) return [];
    return list.map((e) => MovieModel.fromJson(e)).toList();
  }
}

