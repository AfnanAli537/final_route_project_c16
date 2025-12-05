part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadAvailableMovies extends HomeEvent {}

class LoadMoviesByGenre extends HomeEvent {
  final String genre;
  const LoadMoviesByGenre(this.genre);

  @override
  List<Object?> get props => [genre];
}
class LoadMoreAvailableMovies extends HomeEvent {}
class LoadCachedMovies extends HomeEvent {}
