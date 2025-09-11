import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
   CustomLabelText({super.key, required this.number, required this.label});
  final int number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Text(
          "$number",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),       
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}