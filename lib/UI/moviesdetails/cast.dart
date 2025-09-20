import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';

class Cast {
  final String? name;
  final String? character;
  final String? profilePath;

  Cast({this.name, this.character, this.profilePath});
}

class CastList extends StatelessWidget {
  final List<Cast> casts;

  const CastList({Key? key, required this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cast", style: textTheme.bodyLarge),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                      margin: const EdgeInsets.all(8),
                      height: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: cast.profilePath?.isEmpty ?? true
                              ? NetworkImage(
                                  "https://image.tmdb.org/t/p/w500${cast.profilePath}")
                              : AssetImage(
                                  'assets/images/onboarding${index + 1}.png'),
                          //as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Actor: ${cast.name}",
                              style: textTheme.bodyMedium),
                          Text("Character: ${cast.character}",
                              style: textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: casts.length,
          ),
        ],
      ),
    );
  }
}
