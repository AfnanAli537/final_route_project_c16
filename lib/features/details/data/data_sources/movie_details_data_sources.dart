import 'package:final_route_projcet_c16/features/details/data/models/movie_details_model.dart';

abstract class DetailsDataSource {
  Future<MovieDetailsModel> getMovieDetails(int id);
}