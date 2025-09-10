import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
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
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
       // spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(data.title, style: textTheme.bodyLarge?.copyWith(fontSize: 24)),
         const SizedBox(height: 8),
          Text(
            data.desc ?? "",
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: ColorsApp.gold,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            height: 55,
            child: MaterialButton(
              onPressed: onNext,
              child: Text(isLast ? "Finish" : "Next",
                  style: textTheme.bodyLarge?.copyWith(color: ColorsApp.black)),
            ),
          ),
          const SizedBox(height: 8),
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
                child: const Text(
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
