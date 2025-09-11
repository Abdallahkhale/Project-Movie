import 'package:flutter/material.dart';
import 'package:movies/Core/Custom_widget/CustomTextFormField.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "search",
                prefixIcon: Image.asset(ImagesPath.search),
              ),
              Expanded(child: Center(child: Image.asset(ImagesPath.body)))
            ],
          ),
        ),
      ),
    );
  }
}
