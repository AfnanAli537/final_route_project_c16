import 'package:final_route_projcet_c16/features/search/data/models/movie_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieModel>> searchMovies(String query) ;
}