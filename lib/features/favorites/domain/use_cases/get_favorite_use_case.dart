import 'package:final_route_projcet_c16/features/favorites/data/models/favorite_models.dart';
import 'package:final_route_projcet_c16/features/favorites/domain/repository_interface/favorite_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavoritesUseCase {
  final FavoriteRepo repo;

  GetFavoritesUseCase(this.repo);

  Future<List<FavoriteModel>> call() {
    return repo.getFavorites();
  }
}