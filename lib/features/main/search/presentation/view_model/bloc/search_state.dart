import 'package:final_route_projcet_c16/features/main/search/domain/entities/movie.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> movies;

  SearchLoaded({required this.movies});
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
