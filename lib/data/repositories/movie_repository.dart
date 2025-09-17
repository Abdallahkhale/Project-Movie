import 'package:dio/dio.dart';
import 'package:movies/data/models/movie.dart';

class MovieRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://yts.mx/api/v2/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await _dio.get("list_movies.json");

      if (response.statusCode == 200) {
        final moviesData = response.data["data"]["movies"] as List?;
        if (moviesData == null) return [];

        return moviesData
            .map((movieJson) => Movie.fromJson(movieJson))
            .toList();
      } else {
        throw Exception("Failed to load movies");
      }
    } on DioError catch (e) {
      throw Exception("Dio error fetching movies: ${e.message}");
    } catch (e) {
      throw Exception("Error fetching movies: $e");
    }
  }

  Future<Movie> getMovieDetails(int id) async {
    try {
      final response = await _dio.get(
        "movie_details.json",
        queryParameters: {"movie_id": id},
      );

      final movieJson = response.data["data"]["movie"];
      final movie = Movie.fromJson(movieJson);

      final suggestionsResponse = await _dio.get(
        "movie_suggestions.json",
        queryParameters: {"movie_id": id},
      );

      final suggestionsData =
          suggestionsResponse.data["data"]["movies"] as List?;
      final similarMovies = suggestionsData != null
          ? suggestionsData.map((m) => Movie.fromJson(m)).toList()
          : <Movie>[];

      return movie.copyWith(similarMovies: similarMovies);
    } on DioError catch (e) {
      throw Exception("Dio error fetching movie details: ${e.message}");
    } catch (e) {
      throw Exception("Error fetching movie details: $e");
    }
  }
}
