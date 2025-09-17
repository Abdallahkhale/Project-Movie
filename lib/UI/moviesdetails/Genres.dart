import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';

class Genres extends StatelessWidget {
  final List<String> genres;

  const Genres({Key? key, required this.genres}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            "Genres",
            style: textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: genres
                .map((g) => Chip(
                      label: Text(g),
                      backgroundColor: ColorsApp.greyblack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
