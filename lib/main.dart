import 'package:flutter/material.dart';
import 'package:movies/Core/theme/theme.dart';
import 'package:movies/UI/authentication/login_view.dart';
import 'package:movies/UI/authentication/register_view.dart';
import 'package:movies/UI/home/home_view.dart';
import 'package:movies/UI/onboarding/onboarding_screen.dart';
<<<<<<< HEAD
=======
import 'package:movies/UI/profile/update_profile.dart';
>>>>>>> main

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        UpdateProfile.routeName: (context) => const UpdateProfile(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
<<<<<<< HEAD
=======
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => const RegisterView(),
        HomeView.routeName: (context) => const HomeView(),
>>>>>>> main
      },
    );
  }
}
