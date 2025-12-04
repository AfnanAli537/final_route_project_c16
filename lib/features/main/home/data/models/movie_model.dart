
import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.image,
    required double super.rating,
    // required super.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String,
        rating: (json['rating'] as num).toDouble(),
        // genres: List<String>.from(json['genres'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'rating': rating,
        // 'genres': genres,
      };

  // convert to entity
  Movie toEntity() => Movie(
        id: id,
        title: title,
        image: image,
        rating: rating,
        // genres: genres,
      );
}
