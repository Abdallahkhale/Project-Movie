import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
    required this.backgroundColor,
    required this.child,
    this.onPressed,

  });
  Function()? onPressed;
  final Color backgroundColor;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      
      style: ButtonStyle(
        
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child:  child
    );
  }
}