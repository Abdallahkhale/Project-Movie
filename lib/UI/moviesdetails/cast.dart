import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/logic/bloc/MovieDetailsCubit.dart';
import 'package:movies/logic/states/MovieDetailsState.dart';

class Cast {
  final String name;
  final String character;
  final String profilePath;

  Cast({
    required this.name,
    required this.character,
    required this.profilePath,
  });
}

class CastList extends StatelessWidget {
  const CastList({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailsLoaded) {
            final List<Cast> casts = state.movie.cast
                .map((c) => Cast(
                      name: c["name"] ?? "",
                      character: c["character"] ?? "",
                      profilePath: c["url"] ?? "",
                    ))
                .toList();

            if (casts.isEmpty) {
              return const Text(
                "No cast available",
                style: TextStyle(color: Colors.white70),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cast",
                    style: textTheme.bodyLarge?.copyWith(color: Colors.white)),
                const SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: casts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final cast = casts[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: ColorsApp.greyblack,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: size.width * 0.25,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: cast.profilePath.isNotEmpty
                                    ? NetworkImage(cast.profilePath)
                                    : const AssetImage(
                                            'assets/images/onboarding3.png')
                                        as ImageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Actor: ${cast.name}",
                                    style: textTheme.bodyMedium
                                        ?.copyWith(color: Colors.white)),
                                Text("Character: ${cast.character}",
                                    style: textTheme.bodySmall
                                        ?.copyWith(color: Colors.white70)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is MovieDetailsError) {
            return Text(
              "Failed to load cast: ${state.message}",
              style: const TextStyle(color: Colors.red),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
