import 'package:final_route_projcet_c16/features/favorites/data/models/favorite_models.dart';

abstract class FavoriteRepo {
  Future<String> addFavorite(FavoriteModel model);

  Future<List<FavoriteModel>> getFavorites();

  Future<bool> isFavorite(String movieId);

  Future<String> removeFavorite(String movieId);
}
