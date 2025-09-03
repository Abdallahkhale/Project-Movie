import 'package:flutter/material.dart';

import 'package:movies/Core/theme/theme.dart';
import 'package:movies/UI/profile/update_profile.dart';
import 'package:movies/UI/onboarding/onboarding_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.theme,
      debugShowCheckedModeBanner: false
      ,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        '/updateProfile': (context) => const UpdateProfile(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),

      },
    );
  }
}


    