import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/data/models/movie.dart';

class MovieRepository {
  final String baseUrl = "https://yts.mx/api/v2/list_movies.json";

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List movies = jsonData["data"]["movies"];
      return movies.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
