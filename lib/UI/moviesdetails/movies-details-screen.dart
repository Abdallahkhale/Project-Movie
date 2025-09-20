import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';
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
                    const ScreenShots(
                      images: [
                        ImagesPath.onboarding1,
                        ImagesPath.onboarding2,
                        ImagesPath.onboarding3,
                      ],
                    ),
                    SimilarMovies(),
                    Summary(),
                    CastList(
                      casts: [
                        Cast(
                          name: "Name : Hayley Atwell",
                          character: "Character : Captain Carter",
                          profilePath: ImagesPath.onboarding1,
                        ),
                        Cast(
                            name: "Name : Elizabeth Olsen",
                            character:
                                "Character : Wanda Maximoff / The Scarlet Witch",
                            profilePath: ImagesPath.onboarding2),
                        Cast(
                            name: "Name : Rachel McAdams",
                            character: "Character : Dr. Christine Palmer",
                            profilePath: ImagesPath.onboarding3),
                        Cast(
                            name: "Name : Charlize Theron",
                            character: "Character : Clea",
                            profilePath: ImagesPath.onboarding4),
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
