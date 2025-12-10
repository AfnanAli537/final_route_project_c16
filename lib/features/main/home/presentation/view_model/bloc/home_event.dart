part of 'home_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object?> get props => [];
}

class LoadAvailableMovies extends MoviesEvent {}

class LoadMoviesByGenre extends MoviesEvent {
  final String genre;
  const LoadMoviesByGenre(this.genre);

  @override
  List<Object?> get props => [genre];
}
class LoadMoreAvailableMovies extends MoviesEvent {}
class ReloadGenres extends MoviesEvent {}
class CarouselIndexChanged extends MoviesEvent {
  final int index;
  const CarouselIndexChanged(this.index);

  @override
  List<Object?> get props => [index];
}

