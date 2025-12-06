import 'package:final_route_projcet_c16/features/main/home/domain/entities/movie_entity.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.image,
    required super.rating,
    required super.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id']?? 0,
        title: json['title'] ??"",
        image: json['medium_cover_image']??"",
        rating: json['rating'] ?.toDouble() ?? 0.0,
        genres: json['genres'] ?? [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'rating': rating,
        'genres': genres,
      };


  Movie toEntity() => Movie(
        id: id,
        title: title,
        image: image,
        rating: rating,
        genres: genres,
      );
}

























// import 'torrent.dart';

// class Movie {
//   final int id;
//   final String url;
//   final String imdbCode;
//   final String title;
//   final String titleEnglish;
//   final String titleLong;
//   final String slug;
//   final int year;
//   final double rating;
//   final int runtime;
//   final List<String> genres;
//   final String summary;
//   final String descriptionFull;
//   final String synopsis;
//   final String ytTrailerCode;
//   final String language;
//   final String mpaRating;
//   final String backgroundImage;
//   final String backgroundImageOriginal;
//   final String smallCoverImage;
//   final String mediumCoverImage;
//   final String largeCoverImage;
//   final String state;
//   final List<Torrent> torrents;
//   final String dateUploaded;
//   final int dateUploadedUnix;

//   Movie({
//     required this.id,
//     required this.url,
//     required this.imdbCode,
//     required this.title,
//     required this.titleEnglish,
//     required this.titleLong,
//     required this.slug,
//     required this.year,
//     required this.rating,
//     required this.runtime,
//     required this.genres,
//     required this.summary,
//     required this.descriptionFull,
//     required this.synopsis,
//     required this.ytTrailerCode,
//     required this.language,
//     required this.mpaRating,
//     required this.backgroundImage,
//     required this.backgroundImageOriginal,
//     required this.smallCoverImage,
//     required this.mediumCoverImage,
//     required this.largeCoverImage,
//     required this.state,
//     required this.torrents,
//     required this.dateUploaded,
//     required this.dateUploadedUnix,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       id: json["id"],
//       url: json["url"],
//       imdbCode: json["imdb_code"],
//       title: json["title"],
//       titleEnglish: json["title_english"],
//       titleLong: json["title_long"],
//       slug: json["slug"],
//       year: json["year"],
//       rating: (json["rating"] as num).toDouble(),
//       runtime: json["runtime"],
//       genres: List<String>.from(json["genres"]),
//       summary: json["summary"],
//       descriptionFull: json["description_full"],
//       synopsis: json["synopsis"],
//       ytTrailerCode: json["yt_trailer_code"],
//       language: json["language"],
//       mpaRating: json["mpa_rating"],
//       backgroundImage: json["background_image"],
//       backgroundImageOriginal: json["background_image_original"],
//       smallCoverImage: json["small_cover_image"],
//       mediumCoverImage: json["medium_cover_image"],
//       largeCoverImage: json["large_cover_image"],
//       state: json["state"],
//       torrents: (json["torrents"] as List)
//           .map((t) => Torrent.fromJson(t))
//           .toList(),
//       dateUploaded: json["date_uploaded"],
//       dateUploadedUnix: json["date_uploaded_unix"],
//     );
//   }
// }
