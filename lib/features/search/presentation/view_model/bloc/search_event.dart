abstract class SearchEvent {}

class SearchMovieEvent extends SearchEvent{
  final String query;

  SearchMovieEvent({required this.query});
}
