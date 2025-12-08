class MovieSuggestion {
  final int id;
  final String title;
  final double rating;
  final String poster;
  final String? summary;

  MovieSuggestion({
    required this.id,
    required this.title,
    required this.rating,
    required this.poster,
    required this.summary,
  });

  factory MovieSuggestion.fromJson(Map<String, dynamic> json) {
    return MovieSuggestion(
      id: json['id']??0,
      title: json['title']??'',
      rating: (json['rating'] ?? 0).toDouble(),
      poster: json['medium_cover_image'] ?? '',
      summary: json['summary']??"",
    );
  }
}
