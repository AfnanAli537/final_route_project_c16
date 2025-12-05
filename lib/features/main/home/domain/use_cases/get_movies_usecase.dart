import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/repositories_interface/remote_movies_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMoviesUseCase {
  final MoviesRepository repository;

  GetMoviesUseCase(this.repository);

  Future<List<Movie>> call({
    String? genre,
    int limit = 20,
    int page = 1,
    String sortBy = "date_added",
  }) async {
    return repository.getMovies(
      genre: genre,
      limit: limit,
      page: page,
      sortBy: sortBy,
    );
  }
}
