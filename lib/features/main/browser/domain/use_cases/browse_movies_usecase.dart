import 'package:final_route_projcet_c16/features/main/browser/domain/repositories_interface/browser_repo.dart';
import 'package:final_route_projcet_c16/features/main/search/domain/entities/movie.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrowseMoviesUseCase {
  final BrowserRepo repo;
  BrowseMoviesUseCase(this.repo);
  Future<List<Movie>> call(){
    return repo.getMovies();
  }
}