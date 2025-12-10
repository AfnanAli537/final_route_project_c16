import 'package:final_route_projcet_c16/features/favorites/domain/repository_interface/favorite_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class IsFavoriteUseCase {
  final FavoriteRepo repo;

  IsFavoriteUseCase(this.repo);

  Future<bool> call(String movieId) => repo.isFavorite(movieId);
}