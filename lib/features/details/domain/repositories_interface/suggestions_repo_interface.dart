
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_suggsetions_entity.dart';

abstract class SuggestionsRepository {
  Future<List<MovieSuggestionEntity>> getSuggestions(int movieId);
}
