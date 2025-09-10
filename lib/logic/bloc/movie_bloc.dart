import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/repositories/movie_repository.dart';
import 'package:movies/logic/events/movie_event.dart';
import 'package:movies/logic/states/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await movieRepository.fetchMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
}
