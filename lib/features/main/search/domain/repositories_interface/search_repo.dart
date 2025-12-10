import 'package:final_route_projcet_c16/features/main/search/domain/entities/movie.dart';

abstract class SearchRepo {
  Future<List<Movie>> searchMovies(String query);
}