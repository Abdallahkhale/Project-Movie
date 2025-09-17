import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/logic/bloc/MovieDetailsCubit.dart';
import 'package:movies/logic/states/MovieDetailsState.dart';

class ScreenShots extends StatelessWidget {
  const ScreenShots({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is MovieDetailsLoading) {
          return const Center(
              child: CircularProgressIndicator(color: ColorsApp.gold));
        } else if (state is MovieDetailsLoaded) {
          final images = state.movie.screenshots;

          if (images.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "No screenshots available",
                style: TextStyle(color: Colors.white70),
              ),
            );
          }

          return SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Screen Shots',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...images.map((url) {
                    final fullUrl =
                        url; // لو الصور من API جاهزة، مفيش داعي للـ tmdb
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: fullUrl,
                          width: size.width,
                          height: size.height * 0.25,
                          fit: BoxFit.cover,
                          placeholder: (context, _) => const Center(
                            child: CircularProgressIndicator(
                                color: ColorsApp.gold),
                          ),
                          errorWidget: (context, _, __) => const Icon(
                            Icons.broken_image,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        } else if (state is MovieDetailsError) {
          return Text(
            "Failed to load screenshots: ${state.message}",
            style: const TextStyle(color: Colors.red),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
