import 'package:final_route_projcet_c16/features/search/data/models/movie_model.dart';

abstract class BrowseRemoteDS {
  Future<List<MovieModel>> getMovies();
}