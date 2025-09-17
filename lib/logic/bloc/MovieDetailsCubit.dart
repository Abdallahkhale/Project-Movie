import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/repositories/movie_repository.dart';
import 'package:movies/logic/states/MovieDetailsState.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieRepository repository;

  MovieDetailsCubit(this.repository) : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(int id) async {
    try {
      emit(MovieDetailsLoading());
      final movie = await repository.getMovieDetails(id);
      emit(MovieDetailsLoaded(movie));
    } catch (e, stackTrace) {
      // Debugging purpose
      print("Error fetching movie details: $e");
      print(stackTrace);
      emit(MovieDetailsError(e.toString()));
    }
  }
}
