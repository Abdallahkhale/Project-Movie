import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';

class ScreenShots extends StatelessWidget {
  final List<String> images;

  const ScreenShots({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final displayImages = images.isNotEmpty
        ? images.map((url) => "https://image.tmdb.org/t/p/w500$url").toList()
        : [
            "assets/images/onboarding1.png",
            "assets/images/onboarding2.png",
            "assets/images/onboarding3.png",
          ];

    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            ...displayImages.map(
              (url) {
                final isNetwork = url.startsWith('http');
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: isNetwork
                        ? CachedNetworkImage(
                            imageUrl: url,
                            width: size.width,
                            height: size.height * 0.25,
                            fit: BoxFit.cover,
                            placeholder: (context, _) => const Center(
                              child: CircularProgressIndicator(
                                  color: ColorsApp.gold),
                            ),
                            errorWidget: (context, _, __) => Image.asset(
                              'assets/images/static1.png',
                              width: size.width,
                              height: size.height * 0.25,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.asset(
                            url,
                            width: size.width,
                            height: size.height * 0.25,
                            fit: BoxFit.cover,
                          ),
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
