import 'package:final_route_projcet_c16/features/details/data/models/movie_suggestion.dart';

abstract class SuggestionsDataSource {
  Future<List<MovieSuggestion>> getSuggestions(int movieId);
}