import 'package:flutter/material.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImagesPath.onboarding5,
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
