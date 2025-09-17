import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/logic/bloc/MovieDetailsCubit.dart';
import 'package:movies/logic/states/MovieDetailsState.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailsLoaded) {
            final summaryText = state.movie.descriptionFull.isNotEmpty
                ? state.movie.descriptionFull
                : "No summary available.";

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Summary",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  summaryText,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),
              ],
            );
          } else if (state is MovieDetailsError) {
            return Text(
              "Failed to load summary: ${state.message}",
              style: const TextStyle(color: Colors.red),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
