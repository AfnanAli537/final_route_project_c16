part of 'movie_suggestions_bloc.dart';

sealed class MovieSuggestionsEvent extends Equatable {
  const MovieSuggestionsEvent();

  @override
  List<Object> get props => [];
}
final class FetchSuggestions extends MovieSuggestionsEvent {
  final int movieId;

  const FetchSuggestions(this.movieId);

  @override
  List<Object> get props => [movieId];
}

