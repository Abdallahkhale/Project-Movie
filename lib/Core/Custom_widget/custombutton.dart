import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Widget? child;
  final Color color;

  const CustomButtonWidget({
    super.key,
    this.onTap,
    this.backgroundColor,
    required this.child,
    required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: color),
        ),
      ),
      child: child,
    );
  }
}