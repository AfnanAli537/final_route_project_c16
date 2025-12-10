import 'package:final_route_projcet_c16/features/favorites/domain/repository_interface/favorite_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFavoriteUseCase {
  final FavoriteRepo repo;

  RemoveFavoriteUseCase(this.repo);

  Future<String> call(String movieId) => repo.removeFavorite(movieId);
}