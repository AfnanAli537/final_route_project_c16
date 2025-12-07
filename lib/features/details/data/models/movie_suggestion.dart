class MovieSuggestion {
  final int id;
  final String title;
  final double rating;
  final String poster;

  MovieSuggestion({
    required this.id,
    required this.title,
    required this.rating,
    required this.poster,
  });

  factory MovieSuggestion.fromJson(Map<String, dynamic> json) {
    return MovieSuggestion(
      id: json['id']??0,
      title: json['title']??'',
      rating: (json['rating'] ?? 0).toDouble(),
      poster: json['medium_cover_image'] ?? '',
    );
  }
}
