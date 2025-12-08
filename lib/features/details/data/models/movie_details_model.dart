import 'package:final_route_projcet_c16/features/details/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required super.id,
    required super.title,
    required super.year,
    required super.description,
    required super.poster,
    required super.background,
    required super.rating,
    required super.runtime,
    required super.likeCount,
    required super.screenshots,
    required super.cast,
    required super.genres,
    required super.url,
    required super.ytTrailerCode,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      year: json['year'].toString(),
      description: json['description_full'] ?? '',
      poster: json['medium_cover_image'] ?? '',
      background: json['background_image'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      runtime: json['runtime'] ?? 0,
      likeCount: json['like_count'] ?? 0,
      screenshots: [
        json['medium_screenshot_image1'] ?? "",
        json['medium_screenshot_image2'] ?? "",
        json['medium_screenshot_image3'] ?? "",
      ],
      cast: (json['cast'] as List<dynamic>? ?? []).map((e) => Cast(
        name: e['name'] ?? '',
        character: e['character_name'] ?? '',
        profileImage: e['url_small_image'] ?? '',
      )).toList(),

      genres: List<String>.from(json['genres'] ?? []),
      url: json['url'] ?? "",
      ytTrailerCode: json['yt_trailer_code'] ?? '',
    );
  }
}
