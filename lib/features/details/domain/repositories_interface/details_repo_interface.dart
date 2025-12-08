import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetailsEntity> getMovieDetails(int id);
}