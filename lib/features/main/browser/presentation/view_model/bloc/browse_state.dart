import 'package:final_route_projcet_c16/features/main/search/domain/entities/movie.dart';

abstract class BrowseState {}

final class BrowseInitial extends BrowseState {}

final class BrowseLoading extends BrowseState {}

class BrowseLoaded extends BrowseState {
  final List<Movie> movies;

  BrowseLoaded({required this.movies});
}

class BrowseError extends BrowseState {
  final String message;

  BrowseError({required this.message});
}
