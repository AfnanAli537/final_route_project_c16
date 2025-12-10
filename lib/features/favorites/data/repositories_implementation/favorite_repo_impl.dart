import 'package:final_route_projcet_c16/features/favorites/data/data_sources/favorites_remote_ds.dart';
import 'package:final_route_projcet_c16/features/favorites/data/models/favorite_models.dart';
import 'package:final_route_projcet_c16/features/favorites/domain/repository_interface/favorite_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoriteRepo)
class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteRemoteDs remoteDs;

  FavoriteRepoImpl(this.remoteDs);

  @override
  Future<String> addFavorite(FavoriteModel model) => remoteDs.addFavorite(model);

  @override
  Future<List<FavoriteModel>> getFavorites() => remoteDs.getFavorites();

  @override
  Future<bool> isFavorite(String movieId) => remoteDs.isFavorite(movieId);

  @override
  Future<String> removeFavorite(String movieId) => remoteDs.removeFavorite(movieId);
}