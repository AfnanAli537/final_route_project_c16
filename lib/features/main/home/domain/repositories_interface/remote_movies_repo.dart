import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMovies({
    int limit,
    int page,
    String? genre,
    String? sortBy,  int? minRating,  String? query,
  });
}
