import 'package:bloc/bloc.dart';
import 'package:final_route_projcet_c16/features/main/browser/domain/use_cases/browse_movies_usecase.dart';
import 'package:final_route_projcet_c16/features/main/browser/presentation/view_model/bloc/browse_state.dart';
import 'package:injectable/injectable.dart';

import 'browse_event.dart';

@injectable
class BrowseBloc extends Bloc<BrowseEvent, BrowseState> {
  final BrowseMoviesUseCase useCase;

  BrowseBloc(this.useCase) : super(BrowseInitial()) {
    on<LoadMovieEvent>((event, emit) => browseMovies(emit));
  }

  Future<void> browseMovies(Emitter<BrowseState> emit) async {
    emit(BrowseLoading());
    try {
      final movies = await useCase();
      emit(BrowseLoaded(movies: movies));
    } catch (e) {
      emit(BrowseError(message: e.toString()));
    }
  }
}
