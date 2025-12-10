import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/network/endpoints.dart';
import 'package:final_route_projcet_c16/core/services/session_service.dart';
import 'package:final_route_projcet_c16/features/favorites/data/data_sources/favorites_remote_ds.dart';
import 'package:final_route_projcet_c16/features/favorites/data/models/favorite_models.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoriteRemoteDs)
class FavoriteRemoteDsImpl implements FavoriteRemoteDs {
  final Dio dio;

  FavoriteRemoteDsImpl(this.dio);

  @override
  Future<String> addFavorite(FavoriteModel model) async {
    final token = await SessionService.getAuthToken();
    if (token == null || token.isEmpty) throw Exception("User not logged in");

    final response = await dio.post(
      "${Endpoints.authBaseUrl}${Endpoints.addFavorite}",
      data: model.toJson(),
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    return response.data["message"];
  }

  @override
  Future<List<FavoriteModel>> getFavorites() async {
    final token = await SessionService.getAuthToken();
    if (token == null || token.isEmpty) throw Exception("User not logged in");

    final response = await dio.get(
      "${Endpoints.authBaseUrl}${Endpoints.getFavorites}",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    final List data = response.data["data"];
    return data.map((e) => FavoriteModel.fromJson(e)).toList();
  }

  @override
  Future<bool> isFavorite(String movieId) async {
    final token = await SessionService.getAuthToken();
    if (token == null || token.isEmpty) throw Exception("User not logged in");

    final response = await dio.get(
      "${Endpoints.authBaseUrl}favorites/is-favorite/$movieId",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    return response.data["data"] as bool;
  }

  @override
  Future<String> removeFavorite(String movieId) async {
    final token = await SessionService.getAuthToken();
    if (token == null || token.isEmpty) throw Exception("User not logged in");

    final response = await dio.delete(
      "${Endpoints.authBaseUrl}favorites/remove/$movieId",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    return response.data["message"];
  }
}