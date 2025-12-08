import 'package:final_route_projcet_c16/features/details/data/data_sources/movie_suggestion_data_sources.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_suggsetions_entity.dart';
import 'package:final_route_projcet_c16/features/details/domain/repositories_interface/suggestions_repo_interface.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:SuggestionsRepository)
class SuggestionsRepositoryImpl implements SuggestionsRepository {
  final SuggestionsDataSource remote;
  SuggestionsRepositoryImpl(this.remote);

  @override
  Future<List<MovieSuggestionEntity>> getSuggestions(int movieId) async {
    final suggestions = await remote.getSuggestions(movieId);
    return suggestions
        .map((e) => MovieSuggestionEntity(
              id: e.id,
              title: e.title,
              rating: e.rating,
              poster: e.poster,
              summary: e.summary,
            ))
        .toList();
  }
}
