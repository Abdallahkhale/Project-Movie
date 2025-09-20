import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/data/repositories/movie_repository.dart';
import 'package:movies/logic/states/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final MovieRepository movieRepository;

  SearchCubit(this.movieRepository) : super(SearchInitial());

  void searchMovies(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    try {
      emit(SearchLoading());
      final movies = await movieRepository.searchMovies(query);
      emit(SearchLoaded(movies));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
