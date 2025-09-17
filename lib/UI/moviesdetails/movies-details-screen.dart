import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/UI/moviesdetails/Genres.dart';
import 'package:movies/UI/moviesdetails/Header.dart';
import 'package:movies/UI/moviesdetails/Similar%20Movies.dart';
import 'package:movies/UI/moviesdetails/Summary.dart';
import 'package:movies/UI/moviesdetails/cast.dart';
import 'package:movies/UI/moviesdetails/screen-shots.dart';
import 'package:movies/data/repositories/movie_repository.dart';
import 'package:movies/logic/bloc/MovieDetailsCubit.dart';
import 'package:movies/logic/states/MovieDetailsState.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {
    final int movieId = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (context) =>
          MovieDetailsCubit(MovieRepository())..fetchMovieDetails(movieId),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorsApp.gold,
              ));
            } else if (state is MovieDetailsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieHeader(),
                    ScreenShots(
                      images: [
                        '/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg',
                        '/1R6cvRtZgsYCkh8UFuWFN33xBP4.jpg',
                        '/h4VB6m0RwcicVEZvzftYZyKXs6K.jpg',
                      ],
                    ),
                    SimilarMovies(),
                    Summary(),
                    CastList(
                      casts: [
                        Cast(
                            name: "Actor 1",
                            character: "Character 1",
                            profilePath: "assets/images/onboarding3.png"),
                        Cast(
                            name: "Actor 2",
                            character: "Character 2",
                            profilePath: "assets/images/onboarding3.png"),
                        Cast(
                            name: "Actor 3",
                            character: "Character 3",
                            profilePath: "assets/images/onboarding3.png"),
                      ],
                    ),
                    Genres(),
                  ],
                ),
              );
            } else if (state is MovieDetailsError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
