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
    required super.similar,
    required super.cast,
    required super.genres,
    required super.url,
    required super.ytTrailerCode,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id']??0,
      title: json['title']??'',
      year: json['year'].toString(),
      description: json['description_full'] ?? json['summary'] ?? '',
      poster: json['medium_cover_image'] ?? '',
      background: json['background_image'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      runtime: json['runtime'] ?? 0,
      likeCount: json['like_count'] ?? 0,
      screenshots: List<String>.from(json['screenshots'] ?? []),
      url:json['url']??"" ,
      similar: (json['similar'] as List<dynamic>? ?? []).map((e) => MovieSummary(
        id: e['id']??0,
        title: e['title']??'',
        poster: e['medium_cover_image']??'',
        rating: (e['rating'] ?? 0).toDouble(),
      )).toList(),
      cast: (json['cast'] as List<dynamic>? ?? []).map((e) => Cast(
        name: e['name']??'',
        character: e['character']??'',
        profileImage: e['profile_image'] ?? '',
      )).toList(),
      genres: List<String>.from(json['genres'] ?? []),
      ytTrailerCode: json['yt_trailer_code'] ?? '',
    );
  }
}
