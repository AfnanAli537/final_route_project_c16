import 'package:final_route_projcet_c16/features/search/domain/entities/movie.dart';
import 'package:final_route_projcet_c16/features/search/domain/repositories_interface/search_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchMoviesUseCase {
  final SearchRepo repo;

  SearchMoviesUseCase( this.repo);

  Future<List<Movie>> call(String query) {
    return repo.searchMovies(query);
  }
}
