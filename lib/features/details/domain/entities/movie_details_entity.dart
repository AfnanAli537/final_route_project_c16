class MovieDetailsEntity {
  final int id;
  final String title;
  final String url;
  final String year;
  final String description;
  final String? poster;
  final String background;
  final double rating;
  final int runtime;
  final int likeCount;
  final List<String> screenshots;
  final List<Cast> cast;
  final List<String> genres;
  final String ytTrailerCode;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.year,
    required this.description,
    required this.poster,
    required this.background,
    required this.rating,
    required this.runtime,
    required this.likeCount,
    required this.screenshots,
    required this.cast,
    required this.url,
    required this.genres,
    required this.ytTrailerCode,
  });
}


class Cast {
  final String name;
  final String character;
  final String profileImage;

  Cast({
    required this.name,
    required this.character,
    required this.profileImage,
  });
}
