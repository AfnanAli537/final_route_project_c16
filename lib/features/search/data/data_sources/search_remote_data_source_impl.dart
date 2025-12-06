import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/error/api_error_handler.dart';
import 'package:final_route_projcet_c16/core/network/api_client.dart';
import 'package:final_route_projcet_c16/core/network/endpoints.dart';
import 'package:final_route_projcet_c16/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:final_route_projcet_c16/features/search/data/models/movie_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiClient client;

  SearchRemoteDataSourceImpl(this.client);

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final response = await client.get(
        Endpoints.listMovies,
        params: {"query_term": query},
      );

      final list = response.data["data"]['movies'] as List;
      return list.map((json) => MovieModel.fromJson(json)).toList();
    } catch (exception) {
      if (exception is DioException) {
        final key = ApiErrorHandler.handleDioErrorKey(exception);
        throw ApiException(message: key, key: key);
      }

      throw ApiException(
        message: ApiErrorHandler.handleUnknownErrorKey(exception),
        key: ApiErrorHandler.handleUnknownErrorKey(exception),
      );
    }
  }
}

