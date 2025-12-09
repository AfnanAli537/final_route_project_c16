import 'package:equatable/equatable.dart';
import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';
import 'package:final_route_projcet_c16/features/details/domain/use_cases/movie_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';
@injectable
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsUseCase getMovieDetails;
  MovieDetailsBloc(this.getMovieDetails) : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>(_onFetchMovieDetails);
  }
  
Future<void> _onFetchMovieDetails(
      FetchMovieDetails event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());
    try {
      final movie = await getMovieDetails(event.movieId);
      emit(MovieDetailsLoaded(movie));
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
