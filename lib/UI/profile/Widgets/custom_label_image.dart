import 'package:flutter/material.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';

class CustomLabelImage extends StatefulWidget {
  const CustomLabelImage({super.key});

  @override
  State<CustomLabelImage> createState() => _CustomLabelState();
}

class _CustomLabelState extends State<CustomLabelImage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       ClipRRect(
          borderRadius: BorderRadius.circular(100),
        child: Image.asset(ImagesPath.avatar4, height: 100)),
        const SizedBox(height: 8),
        Text(
          "John Doe",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}