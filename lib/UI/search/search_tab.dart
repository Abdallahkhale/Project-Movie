import 'package:flutter/material.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImagesPath.onboarding2,
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
