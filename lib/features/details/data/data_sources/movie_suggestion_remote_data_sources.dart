import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/error/api_error_handler.dart';
import 'package:final_route_projcet_c16/core/network/api_client.dart';
import 'package:final_route_projcet_c16/core/network/endpoints.dart';
import 'package:final_route_projcet_c16/features/details/data/data_sources/movie_suggestion_data_sources.dart';
import 'package:final_route_projcet_c16/features/details/data/models/movie_suggestion.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:SuggestionsDataSource)
class SuggestionsRemoteDataSourceImpl implements SuggestionsDataSource {
    final ApiClient remote;
  SuggestionsRemoteDataSourceImpl(this.remote);

  @override
  Future<List<MovieSuggestion>> getSuggestions(int movieId) async {
    try{
    final response = await remote.get(
      Endpoints.movieSuggestions,params: {"movie_id":movieId},
    );

    final movies = response.data['data']['movies'] as List<dynamic>;
    print("movieSuggestions RESPONSE: ${response.data}");
    return movies.map((json) => MovieSuggestion.fromJson(json)).toList();
  }
     catch(exception) {
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