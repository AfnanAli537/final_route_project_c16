
import 'package:final_route_projcet_c16/core/network/network_checker.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/repositories_interface/local_movies_repo.dart';
import 'package:final_route_projcet_c16/features/main/home/domain/use_cases/get_movies_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';



@injectable
class MoviesBloc extends Bloc<HomeEvent, MoviesState> {
  final GetMoviesUseCase getMovies;
  final HomeLocalDataSource localDataSource;

  MoviesBloc(this.getMovies, this.localDataSource) : super(const MoviesState()) {
    
    // -------- Fetch initial movies --------
    on<LoadAvailableMovies>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      try {
        final hasNet = await NetworkChecker.hasInternet();
        List<Movie> movies;

        if (hasNet) {
          // Fetch from remote
      //  movies =  await getMoviesUseCase.call(sortBy: 'date_added', limit: 20, page: 1);
          movies = await getMovies(sortBy: 'date_added', limit: 20, page: 1);


          emit(state.copyWith(availableNow: movies));

          print("Has network? $hasNet");

print("Bloc - Movies fetched: ${movies.length}");
          // Cache page 1
          await localDataSource.cacheAvailableMovies(movies);
print("Cached movies: ${movies.length}");
          emit(state.copyWith(
            availableNow: movies,
            currentPage: 1,
            isLoading: false,
            isOffline: false,
          ));
        } else {
          // Fetch from local cache
          movies = await localDataSource.getCachedAvailableMovies();
          if (movies.isNotEmpty) {
            emit(state.copyWith(
              availableNow: movies,
              currentPage: 1,
              isLoading: false,
              isOffline: true,
            ));
          } else {
            emit(state.copyWith(
              isLoading: false,
              error: 'No internet and no cached movies',
              isOffline: true,
            ));
          }
        }
      } catch (e) {
        // Fallback to cache on error
        final cached = await localDataSource.getCachedAvailableMovies();
        emit(state.copyWith(
          availableNow: cached,
          currentPage: 1,
          isLoading: false,
          isOffline: cached.isNotEmpty,
          error: e.toString(),
        ));
      }
    });

    // -------- Load more movies (pagination) --------
    on<LoadMoreAvailableMovies>((event, emit) async {
      if (state.isLoadingMore) return;
      emit(state.copyWith(isLoadingMore: true, error: null));

      try {
        final hasNet = await NetworkChecker.hasInternet();
        if (!hasNet) {
          emit(state.copyWith(isLoadingMore: false, isOffline: true));
          return;
        }

        final nextPage = state.currentPage + 1;
        final movies = await getMovies(sortBy: 'date_added', limit: 20, page: nextPage);

        if (movies.isEmpty) {
          emit(state.copyWith(isLoadingMore: false));
          return;
        }

        emit(state.copyWith(
          availableNow: [...state.availableNow, ...movies],
          currentPage: nextPage,
          isLoadingMore: false,
          isOffline: false,
        ));
      } catch (e) {
        emit(state.copyWith(isLoadingMore: false, error: e.toString()));
      }
    });

    // -------- Fetch movies by genre --------
    on<LoadMoviesByGenre>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      try {
        final movies = await getMovies(genre: event.genre, limit: 20);
        final updatedGenres = Map<String, List<Movie>>.from(state.moviesByGenre)
          ..[event.genre] = movies;

        emit(state.copyWith(moviesByGenre: updatedGenres, isLoading: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    // -------- Load cached movies manually --------
    on<LoadCachedMovies>((event, emit) async {
      final cached = await localDataSource.getCachedAvailableMovies();
      emit(state.copyWith(
        availableNow: cached,
        isLoading: false,
        isOffline: cached.isNotEmpty,
      ));
    });
  }
}
