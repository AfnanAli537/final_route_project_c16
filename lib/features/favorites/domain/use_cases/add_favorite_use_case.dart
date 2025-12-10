import 'package:final_route_projcet_c16/features/favorites/data/models/favorite_models.dart';
import 'package:final_route_projcet_c16/features/favorites/domain/repository_interface/favorite_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddFavoriteUseCase {
  final FavoriteRepo repo;

  AddFavoriteUseCase(this.repo);

  Future<String> call(FavoriteModel model) {
    return repo.addFavorite(model);
  }
}
