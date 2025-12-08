import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';
import 'package:final_route_projcet_c16/features/details/domain/repositories_interface/details_repo_interface.dart';
import 'package:injectable/injectable.dart';
@injectable
class MovieDetailsUseCase {
  final MovieDetailsRepository repository;

  MovieDetailsUseCase(this.repository);

  Future<MovieDetailsEntity> call(int movieId) async {
    return await repository.getMovieDetails(movieId);
  }
}
