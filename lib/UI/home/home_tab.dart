import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> movies = [
    {"title": "1917", "image": ImagesPath.onboarding2, "rating": 7.7},
    {
      "title": "Captain America",
      "image": ImagesPath.onboarding3,
      "rating": 7.7
    },
    {"title": "Black Widow", "image": ImagesPath.onboarding4, "rating": 7.7},
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsApp.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              movies[currentIndex]["image"],
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: ColorsApp.black.withOpacity(0),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: ColorsApp.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      ImagesPath.availablenow,
                      height: size.height * 0.1,
                    )),
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
                          Image.asset(
                            movie["image"],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                color: ColorsApp.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    movie["rating"].toString(),
                                    style: TextStyle(color: ColorsApp.white),
                                  ),
                                  SizedBox(width: 4),
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
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Action",
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        "See More →",
                        style: textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: movies.map((movie) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        width: size.width * .35,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            children: [
                              Image.asset(
                                movie["image"],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: ColorsApp.black,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        movie["rating"].toString(),
                                        style: TextStyle(
                                            color: ColorsApp.white,
                                            fontSize: 12),
                                      ),
                                      SizedBox(width: 4),
                                      Icon(Icons.star,
                                          color: ColorsApp.gold, size: 14),
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
      ),
    );
  }
}
