import 'package:equatable/equatable.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_suggsetions_entity.dart';
import 'package:final_route_projcet_c16/features/details/domain/use_cases/movie_suggestions_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'movie_suggestions_event.dart';
part 'movie_suggestions_state.dart';
@injectable
class MovieSuggestionsBloc extends Bloc<MovieSuggestionsEvent, MovieSuggestionsState> {
   final  GetSuggestionsUseCase getSuggestions;
  MovieSuggestionsBloc(this.getSuggestions) : super(SuggestionsInitial()) {
    on<FetchSuggestions>(_onFetchSuggestions);
  }
   Future<void> _onFetchSuggestions(
      FetchSuggestions event, Emitter<MovieSuggestionsState> emit) async {
    emit(SuggestionsLoading());
    try {
      final suggestions = await getSuggestions(event.movieId);
      emit(SuggestionsLoaded(suggestions));
    } catch (e) {
      emit(SuggestionsError(e.toString()));
    }
  }
}
