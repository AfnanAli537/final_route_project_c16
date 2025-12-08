import 'package:final_route_projcet_c16/features/main/home/data/models/movie_model.dart';

abstract class MoviesDataSource {
  Future<List<MovieModel>> getMovies({
    int limit,
    int page,
    String? genre,
    String? sortBy,
    int? minRating,
    String? query,
  });
}
