import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';
import 'package:movies/UI/profile/profile_tab.dart';
import 'package:movies/logic/bloc/movie_bloc.dart';
import 'package:movies/logic/states/movie_state.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorsApp.black,
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: ColorsApp.gold,
            ));
          } else if (state is MovieLoaded) {
            final movies = state.movies;

            return Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: movies[currentIndex].backgroundImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsApp.gold,
                    )),
                    errorWidget: (context, url, error) => Image.network(
                        "https://static.vecteezy.com/system/resources/previews/017/178/206/original/loading-bar-progress-icon-with-transparent-background-free-png.png"),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          ImagesPath.availablenow,
                          height: size.height * 0.1,
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: size.height * 0.45,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          viewportFraction: 0.6,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        items: movies.map((movie) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(ProfileTab.routeName);
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: movie.largeCoverImage,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                      color: ColorsApp.gold,
                                    )),
                                    errorWidget: (context, url, error) =>
                                        Image.network(
                                            "https://static.vecteezy.com/system/resources/previews/017/178/206/original/loading-bar-progress-icon-with-transparent-background-free-png.png"),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: ColorsApp.black.withAlpha(80),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          movie.rating.toString(),
                                          style: const TextStyle(
                                              color: ColorsApp.white),
                                        ),
                                        const SizedBox(width: 4),
                                        const Icon(Icons.star,
                                            color: ColorsApp.gold, size: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          ImagesPath.watchnow,
                          height: size.height * 0.15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Action", style: textTheme.bodyLarge),
                            Text("See More ", style: textTheme.headlineSmall),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: movies.map((movie) {
                            return Container(
                              margin: const EdgeInsets.all(8),
                              width: size.width * .35,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Stack(
                                  children: [
                                    CachedNetworkImage(
                                        imageUrl: movie.mediumCoverImage,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: ColorsApp.gold,
                                                        strokeWidth: 2)),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
                                                "https://static.vecteezy.com/system/resources/previews/017/178/206/original/loading-bar-progress-icon-with-transparent-background-free-png.png")),
                                    Positioned(
                                      top: 8,
                                      left: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: ColorsApp.black.withAlpha(80),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              movie.rating.toString(),
                                              style: const TextStyle(
                                                  color: ColorsApp.white,
                                                  fontSize: 12),
                                            ),
                                            const SizedBox(width: 4),
                                            const Icon(Icons.star,
                                                color: ColorsApp.gold,
                                                size: 14),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("No Movies"));
          }
        },
      ),
    );
  }
}
