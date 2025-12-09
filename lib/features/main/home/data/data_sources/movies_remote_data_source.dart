// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/error/api_error_handler.dart';
import 'package:final_route_projcet_c16/core/network/api_client.dart';
import 'package:final_route_projcet_c16/core/network/endpoints.dart';
import 'package:final_route_projcet_c16/features/main/home/data/data_sources/data_sources.dart';
import 'package:injectable/injectable.dart';
import '../models/movie_model.dart';

@LazySingleton(as: MoviesDataSource)
class MoviesRemoteDataSource implements MoviesDataSource {
  final ApiClient remote;
  MoviesRemoteDataSource(this.remote);
  @override
 
  Future<List<MovieModel>> getMovies({
    int limit = 20,
    int page = 1,
    String? genre,
    String? sortBy = "date_added",
    int? minRating,
    String? query,
  }) async {
    try{
    final response = await remote.get(
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
     print("DETAILS FULL URL = ${Endpoints.listMovies}");

    if (list == null) return [];
    return list.map((e) => MovieModel.fromJson(e)).toList();
    
  }
  catch (exception) {
      if (exception is DioException) {
        final key = ApiErrorHandler.handleDioErrorKey(exception);
        throw ApiException(message: key, key: key);
      }
      else{
      throw ApiException(
        message: ApiErrorHandler.handleUnknownErrorKey(exception),
        key: ApiErrorHandler.handleUnknownErrorKey(exception),
      );
      }
    }
  }
}
