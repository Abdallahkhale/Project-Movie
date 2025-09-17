class Movie {
  final int id;
  final String title;
  final double rating;
  final String backgroundImage;
  final String largeCoverImage;
  final List<String> genres;
  final String descriptionFull;
  final List<String> screenshots;
  final List<Map<String, String>> cast;
  final List<Movie> similarMovies;

  Movie({
    required this.id,
    required this.title,
    required this.rating,
    required this.backgroundImage,
    required this.largeCoverImage,
    required this.genres,
    required this.descriptionFull,
    required this.screenshots,
    required this.cast,
    required this.similarMovies,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // فلترة الـ screenshots عشان أي رابط فاضي أو null يتجاهل
    final screenshots = [
      json["medium_screenshot_image1"],
      json["medium_screenshot_image2"],
      json["medium_screenshot_image3"],
    ]
        .where((e) => e != null && e.toString().isNotEmpty)
        .map((e) => e.toString())
        .toList();

    // فلترة الـ cast عشان أي عنصر ناقص يتجاهل
    final castList = (json["cast"] as List<dynamic>?)
            ?.map((c) => {
                  "name": (c["name"] ?? "").toString(),
                  "character": (c["character_name"] ?? "").toString(),
                  "url": (c["url_small_image"] ?? "").toString(),
                })
            .where((c) => c["name"]!.isNotEmpty)
            .toList() ??
        [];

    return Movie(
      id: json["id"] ?? 0,
      title: json["title"] ?? "No Title",
      rating: (json["rating"] is int)
          ? (json["rating"] as int).toDouble()
          : (json["rating"] ?? 0.0).toDouble(),
      backgroundImage: json["background_image"] ?? "",
      largeCoverImage: json["large_cover_image"] ?? "",
      genres: List<String>.from(json["genres"] ?? []),
      descriptionFull: json["description_full"] ?? "",
      screenshots: screenshots,
      cast: castList,
      similarMovies: [], // هتتملي من MovieRepository
    );
  }

  Movie copyWith({
    int? id,
    String? title,
    double? rating,
    String? backgroundImage,
    String? largeCoverImage,
    List<String>? genres,
    String? descriptionFull,
    List<String>? screenshots,
    List<Map<String, String>>? cast,
    List<Movie>? similarMovies,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      largeCoverImage: largeCoverImage ?? this.largeCoverImage,
      genres: genres ?? this.genres,
      descriptionFull: descriptionFull ?? this.descriptionFull,
      screenshots: screenshots ?? this.screenshots,
      cast: cast ?? this.cast,
      similarMovies: similarMovies ?? this.similarMovies,
    );
  }
}
