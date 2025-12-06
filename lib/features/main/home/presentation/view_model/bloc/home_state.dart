part of 'home_bloc.dart';

 class MoviesState extends Equatable {
  final bool isLoading;
  final bool isLoadingMore;
  final List<Movie> availableNow;
  final Map<String, List<Movie>> moviesByGenre;
    final Map<String, int>  genrePages;
  final int currentPage;
  final String? error;

  const MoviesState( {
    this.isLoading = false,
    this.isLoadingMore = false,
    this.availableNow = const [],
    this.moviesByGenre = const {},
    this.genrePages= const {"action":0,"animation":0},
    this.currentPage = 1,
    this.error,
  });

  MoviesState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? isOffline,
    List<Movie>? availableNow,
    Map<String, List<Movie>>? moviesByGenre,
    Map<String, int>? genrePages,
    int? currentPage,
    String? error,
  }) {
    return MoviesState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      availableNow: availableNow ?? this.availableNow,
      moviesByGenre: moviesByGenre ?? this.moviesByGenre,
      currentPage: currentPage ?? this.currentPage,
      genrePages: genrePages ?? this.genrePages,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingMore,
        availableNow,
        moviesByGenre,
        currentPage,
        genrePages,
        error
      ];
}
