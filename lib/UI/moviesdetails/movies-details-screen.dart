import 'package:flutter/material.dart';
import 'package:movies/UI/moviesdetails/Genres.dart';
import 'package:movies/UI/moviesdetails/Header.dart';
import 'package:movies/UI/moviesdetails/Similar%20Movies.dart';
import 'package:movies/UI/moviesdetails/Summary.dart';
import 'package:movies/UI/moviesdetails/cast.dart';
import 'package:movies/UI/moviesdetails/screen-shots.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieHeader(),
            ScreenShots(),
            SimilarMovies(),
            Summary(),
            CastList(),
            Genres(
              genres: [
                "Action",
                "Adventure",
                "Fantasy",
                "Science Fiction",
                "Drama",
                "Thriller"
              ],
            ),
          ],
        ),
      ),
    );
  }
}
