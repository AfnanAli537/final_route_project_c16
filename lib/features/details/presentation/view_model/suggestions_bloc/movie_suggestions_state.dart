part of 'movie_suggestions_bloc.dart';

sealed class MovieSuggestionsState extends Equatable {
  const MovieSuggestionsState();
  
  @override
  List<Object> get props => [];
}

final class SuggestionsInitial extends MovieSuggestionsState {}

final class SuggestionsLoading extends  MovieSuggestionsState{}

final class SuggestionsLoaded extends  MovieSuggestionsState{
  final List<MovieSuggestionEntity> suggestions;

  const SuggestionsLoaded(this.suggestions);

  @override
  List<Object> get props => [suggestions];
}

final class SuggestionsError extends MovieSuggestionsState {
  final String message;

  const SuggestionsError(this.message);

  @override
  List<Object> get props => [message];
}

