import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/UI/authentication/register_view.dart';

import 'onboarding_data.dart';
import 'onboarding_bottom_sheet.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  void _showBottomSheet() {
    if (_currentIndex == 0) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: ColorsApp.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return OnboardingBottomSheet(
          data: onboardingData[_currentIndex],
          onBack: _currentIndex > 1
              ? () {
                  setState(() => _currentIndex--);
                  Navigator.pop(context);
                  _showBottomSheet();
                }
              : null,
          onNext: () {
            if (_currentIndex < onboardingData.length - 1) {
              setState(() => _currentIndex++);
              Navigator.pop(context);
              _showBottomSheet();
            } else {
              Navigator.pop(context);
              Navigator.of(context)
                  .pushReplacementNamed(RegisterView.routeName);
            }
          },
          isLast: _currentIndex == onboardingData.length - 1,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final data = onboardingData[_currentIndex];

    return Scaffold(
      backgroundColor: ColorsApp.black,
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorsApp.black, ColorsApp.black.withOpacity(0)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Image.asset(
              data.image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          if (_currentIndex == 0)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.title,
                      style: textTheme.bodyLarge?.copyWith(fontSize: 36),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    Text(
                      data.desc ?? "",
                      style: textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorsApp.gold,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() => _currentIndex = 1);
                          _showBottomSheet();
                        },
                        child: const Text(
                          "Explore Now",
                          style:
                              TextStyle(color: ColorsApp.black, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
