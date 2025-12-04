import 'package:final_route_projcet_c16/features/main/home/data/data_sources/movies_remote_data_source.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/repositories_interface/remote_movies_repo.dart';
import 'package:injectable/injectable.dart';

// @LazySingleton(as: MoviesRepository)
// class MoviesRepositoryImpl implements MoviesRepository {


//   final MoviesRepository remote;

//   MoviesRepositoryImpl(this.remote);

//   @override
//   Future<List<Movie>> getMovies({
//     String? genre,
//     int limit = 20,
//     int? minRating,
//     int page = 1,
//     String? query,
//     String? sortBy,
//   }) async {
//     return remote.getMovies(
//       limit: limit,
//       page: page,
//       genre: genre,
//       sortBy: sortBy??= "date_added",

//     );
//   }
  

// }


@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource  remote;

  MoviesRepositoryImpl(this.remote);

  @override
  Future<List<Movie>> getMovies({
    String? genre,
    int limit = 20,
    int? minRating,
    int page = 1,
    String? query,
    String? sortBy = "date_added",
  }) async {
    final models = await remote.getMovies(
      genre: genre,
      limit: limit,
      minRating: minRating,
      page: page,
      query: query,
      sortBy: sortBy,
    );
return models.map((m) => m.toEntity()).toList();
  }
}


