import 'package:bloc/bloc.dart';
import 'package:final_route_projcet_c16/core/error/api_error_handler.dart';
import 'package:final_route_projcet_c16/features/main/search/domain/use_cases/search_movies_use_case.dart';
import 'package:final_route_projcet_c16/features/main/search/presentation/view_model/bloc/search_event.dart';
import 'package:final_route_projcet_c16/features/main/search/presentation/view_model/bloc/search_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMoviesUseCase useCase;

  SearchBloc(this.useCase) : super(SearchInitial()) {
    on<SearchMovieEvent>(_searchMovies);
  }

  Future<void> _searchMovies(SearchMovieEvent event,
      Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final result = await useCase(event.query);
      emit(SearchLoaded(movies: result));
    }
    catch (exception) {
      if (exception is ApiException) {
        emit(SearchError(message: exception.key));
      } else {
        emit(SearchError(message: "unexpected_error"));
      }
    }
  }
}
