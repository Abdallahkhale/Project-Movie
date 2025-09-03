import 'package:flutter/material.dart';
import 'package:movies/Core/theme/theme.dart';
import 'package:movies/UI/profile/update_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.theme,
      debugShowCheckedModeBanner: false
      ,
      initialRoute: '/updateProfile',
      routes: {
        '/updateProfile': (context) => const UpdateProfile(),
      },
    );
  }
}


