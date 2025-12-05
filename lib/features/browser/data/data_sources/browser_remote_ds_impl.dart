import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/di/di.dart';
import 'package:final_route_projcet_c16/core/error/api_error_handler.dart';
import 'package:final_route_projcet_c16/core/network/endpoints.dart';
import 'package:final_route_projcet_c16/features/browser/data/data_sources/browse_remote_ds.dart';
import 'package:final_route_projcet_c16/features/search/data/models/movie_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BrowseRemoteDS)
class BrowserRemoteDSImpl implements BrowseRemoteDS {
  final Dio dio = sl<Dio>();

  @override
  Future<List<MovieModel>> getMovies() async {
    try {
      final response = await dio.get(Endpoints.browser);
      final List list = response.data['data']['movies'] ?? [];
      return list.map((e) => MovieModel.fromJson(e)).toList();
    }
    catch (exception) {
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
