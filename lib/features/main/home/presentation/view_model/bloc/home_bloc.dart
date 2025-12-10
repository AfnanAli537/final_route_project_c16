import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/use_cases/get_movies_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMovies;

  MoviesBloc(this.getMovies) : super(const MoviesState()) {
    on<LoadAvailableMovies>(_loadAvailableMovies);
    on<LoadMoreAvailableMovies>(_loadMoreMovies);
    on<LoadMoviesByGenre>(_loadMoviesByGenre);
    // on<ReloadGenres>(_reloadGenresData);
    on<CarouselIndexChanged>(_carouselIndexChanged);


  }

void _carouselIndexChanged(
  CarouselIndexChanged event,
  Emitter<MoviesState> emit,
) {
  emit(state.copyWith(currentCarouselIndex: event.index));
}


// Future<void> _reloadGenresData(
//   ReloadGenres event,
//   Emitter<MoviesState> emit,
// ) async {
//   emit(state.copyWith(isLoading: true, error: null));

//   try {
//     final genres = ['action', 'animation'];
//     final Map<String, List<Movie>> newGenreData = {};
//     final Map<String, int> newPages = Map.from(state.genrePages);
//     for (var genre in genres) {
//       final nextPage = (state.genrePages[genre] ?? 0) + 1;

//       final movies = await getMovies(
//         genre: genre,
//         limit: 20,
//         page: nextPage,
//       );

//       newGenreData[genre] = movies; 
//       newPages[genre] = nextPage;   
//     }

//     emit(state.copyWith(
//       moviesByGenre: newGenreData,
//       genrePages: newPages,
//       isLoading: false,
//     ));
//   } catch (e) {
//     emit(state.copyWith(isLoading: false, error: e.toString()));
//   }
// }

  Future<void> _loadAvailableMovies(
    LoadAvailableMovies event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final movies = await getMovies(sortBy: 'date_added', limit: 20, page: 1);

      emit(
        state.copyWith(availableNow: movies, currentPage: 1, isLoading: false),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _loadMoreMovies(
    LoadMoreAvailableMovies event,
    Emitter<MoviesState> emit,
  ) async {

    emit(state.copyWith(isLoadingMore: true));

    try {
      final nextPage = state.currentPage + 1;

      final movies = await getMovies(
        sortBy: 'date_added',
        limit: 20,
        page: nextPage,
      );

      emit(
        state.copyWith(
          availableNow: [...state.availableNow, ...movies],
          currentPage: nextPage,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false, error: e.toString()));
    }
  }

  Future<void> _loadMoviesByGenre(
    LoadMoviesByGenre event,
    Emitter<MoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final movies = await getMovies(genre: event.genre, limit: 20,page: 1);

      final updatedMap = Map<String, List<Movie>>.from(state.moviesByGenre)
        ..[event.genre] = movies;

      emit(state.copyWith(moviesByGenre: updatedMap, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

}
