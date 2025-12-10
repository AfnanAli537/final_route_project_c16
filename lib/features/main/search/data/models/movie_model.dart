import 'package:final_route_projcet_c16/features/main/search/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.image,
    required super.rating,
    required super.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      genres: List<String>.from(json['genres'] ?? []),
      id: json['id'],
      title: json['title'],
      image: json['medium_cover_image'],
      rating: json['rating'],
    );
  }
}
