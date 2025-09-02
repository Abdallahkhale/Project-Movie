import 'package:flutter/material.dart';

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
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(
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
              //navigator.pushReplacementNamed(context, registerScreen.routeName)
            }
          },
          isLast: _currentIndex == onboardingData.length - 1,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = onboardingData[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black.withValues(alpha: 0)],
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
                padding: EdgeInsets.all(10),
                child: Column(
                  spacing: 15,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      data.desc ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() => _currentIndex = 1);
                          _showBottomSheet();
                        },
                        child: Text(
                          "Explore Now",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
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
