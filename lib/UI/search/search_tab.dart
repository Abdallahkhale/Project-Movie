import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/Custom_widget/CustomTextFormField.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';
import 'package:movies/UI/moviesdetails/movies-details-screen.dart';
import 'package:movies/logic/bloc/search_state.dart';
import 'package:movies/logic/states/search_state.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomTextFormField(
                hintText: "Search",
                prefixIcon: Image.asset(ImagesPath.search),
                onChanged: (value) {
                  if (value.isEmpty) {
                  } else {
                    searchCubit.searchMovies(value);
                  }
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ColorsApp.gold,
                      ),
                    );
                  } else if (state is SearchLoaded) {
                    if (state.movies.isEmpty) {
                      return const Center(
                        child: Text("No movies found"),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MovieDetailsScreen.routeName,
                              arguments: movie.id,
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  movie.largeCoverImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        movie.rating.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(
                      child: Text("Error: ${state.message}"),
                    );
                  }

                  return Center(
                    child: Image.asset(ImagesPath.body),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
