import 'package:final_route_projcet_c16/features/search/domain/entities/movie.dart';

abstract class BrowserRepo {
  Future<List<Movie>> getMovies();
}