
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_suggsetions_entity.dart';
import 'package:final_route_projcet_c16/features/details/domain/repositories_interface/suggestions_repo_interface.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetSuggestionsUseCase {
  final SuggestionsRepository repository;

  GetSuggestionsUseCase(this.repository);

  Future<List<MovieSuggestionEntity>> call(int movieId) async {
    return await repository.getSuggestions(movieId);
  }
}
