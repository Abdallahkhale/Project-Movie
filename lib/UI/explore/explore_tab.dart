import 'package:flutter/material.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImagesPath.onboarding6,
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
