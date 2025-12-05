part of 'home_bloc.dart';

class MoviesState extends Equatable {
  final bool isLoading;
  final bool isLoadingMore;
  final bool isOffline; 
  final List<Movie> availableNow;
  final Map<String, List<Movie>> moviesByGenre;
  final int currentPage;
  final String? error;

  const MoviesState({
    this.isLoading = false,
    this.isLoadingMore = false,
    this.isOffline = false,
    this.availableNow = const [],
    this.moviesByGenre = const {},
    this.currentPage = 1,
    this.error,
  });

  MoviesState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? isOffline,
    List<Movie>? availableNow,
    Map<String, List<Movie>>? moviesByGenre,
    int? currentPage,
    String? error,
  }) {
    return MoviesState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isOffline: isOffline ?? this.isOffline,
      availableNow: availableNow ?? this.availableNow,
      moviesByGenre: moviesByGenre ?? this.moviesByGenre,
      currentPage: currentPage ?? this.currentPage,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingMore,
        isOffline,
        availableNow,
        moviesByGenre,
        currentPage,
        error
      ];
}
