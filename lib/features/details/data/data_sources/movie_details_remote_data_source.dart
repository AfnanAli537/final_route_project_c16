import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/error/api_error_handler.dart';
import 'package:final_route_projcet_c16/core/network/api_client.dart';
import 'package:final_route_projcet_c16/core/network/endpoints.dart';
import 'package:final_route_projcet_c16/features/details/data/data_sources/movie_details_data_sources.dart';
import 'package:final_route_projcet_c16/features/details/data/models/movie_details_model.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: DetailsDataSource)
class MovieRemoteDataSourceImpl implements DetailsDataSource {
   final ApiClient remote;
  MovieRemoteDataSourceImpl(this.remote);

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    try{
    final response = await remote.get(Endpoints.details,params:{'movie_id': id});
    print("DETAILS FULL URL = ${Endpoints.details}?movie_id=$id");

    print("DETAILS RESPONSE: ${response.data}");
    return MovieDetailsModel.fromJson(response.data['data']['movie']);
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