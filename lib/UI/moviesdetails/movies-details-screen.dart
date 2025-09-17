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
                  children: const [
                    MovieHeader(), // جوه ال Widget هتجيب البيانات من Bloc
                    ScreenShots(), // جوه ال Widget هتجيب الصور من Bloc
                    SimilarMovies(), // جوه ال Widget هتجيب similarMovies من Bloc
                    Summary(), // جوه ال Widget هتجيب descriptionFull من Bloc
                    CastList(), // جوه ال Widget هتجيب cast من Bloc
                    Genres(), // جوه ال Widget هتجيب genres من Bloc
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
