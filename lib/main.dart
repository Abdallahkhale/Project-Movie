import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/Core/network/dio_helper_network.dart';
import 'package:movies/Core/theme/theme.dart';

import 'package:movies/UI/authentication/login_view.dart';
import 'package:movies/UI/authentication/register_view.dart';
import 'package:movies/UI/home/home_view.dart';
import 'package:movies/UI/onboarding/onboarding_screen.dart';
import 'package:movies/UI/profile/update_profile.dart';

import 'package:movies/data/repositories/movie_repository.dart';
import 'package:movies/logic/bloc/movie_bloc.dart';
import 'package:movies/logic/events/movie_event.dart';

void main() {
  final MovieRepository movieRepository = MovieRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(movieRepository)..add(FetchMovies()),
        ),
      ],
      child: const MyApp(),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
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
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => const RegisterView(),
        HomeView.routeName: (context) => HomeView(),
      },
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
