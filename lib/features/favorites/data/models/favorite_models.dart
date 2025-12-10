class FavoriteModel {
  final String movieId;
  final String name;
  final double rating;
  final String imageURL;
  final String year;

  FavoriteModel({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      movieId: json['movieId'],
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      imageURL: json['imageURL'] ?? '',
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "movieId": movieId,
      "name": name,
      "rating": rating,
      "imageURL": imageURL,
      "year": year,
    };
  }

}
