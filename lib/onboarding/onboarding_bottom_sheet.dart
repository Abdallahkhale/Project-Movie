import 'package:flutter/material.dart';
import 'onboarding_data.dart';

class OnboardingBottomSheet extends StatelessWidget {
  final OnboardingItem data;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final bool isLast;

  const OnboardingBottomSheet({
    super.key,
    required this.data,
    this.onNext,
    this.onBack,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          Text(
            data.desc ?? "",
            style: TextStyle(color: Colors.white70, fontSize: 20),
            textAlign: TextAlign.center,
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.amber,

              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            height: 55,
            child: MaterialButton(
              onPressed: onNext,

              child: Text(
                isLast ? "Finish" : "Next",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          if (onBack != null)
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: MaterialButton(
                onPressed: onBack,
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
