class Movie {
  final int id;
  final String title;
  final double rating;
  final String backgroundImage;
  final String mediumCoverImage;
  final String largeCoverImage;

  Movie({
    required this.id,
    required this.title,
    required this.rating,
    required this.backgroundImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"] ?? 0,
      title: json["title"] ?? "No Title",
      rating: (json["rating"] is int)
          ? (json["rating"] as int).toDouble()
          : (json["rating"] ?? 0.0).toDouble(),
      backgroundImage: json["background_image"] ?? "",
      mediumCoverImage: json["medium_cover_image"] ?? "",
      largeCoverImage: json["large_cover_image"] ?? "",
    );
  }
}
