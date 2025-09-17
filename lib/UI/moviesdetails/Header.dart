import 'package:flutter/material.dart';
import 'package:movies/Core/Custom_widget/custombutton.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';

class MovieHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/images/onboarding5.png',
          height: size.height * .75,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Image.asset(
                "assets/images/love.png",
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    // Handle play button tap
                  },
                  child: Image.asset(
                    "assets/images/play.png",
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Text(
                "Doctor Strange in the Multiverse of Madness",
                style: textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButtonWidget(
                    onTap: () {},
                    backgroundColor: Colors.red,
                    child: const Text("Watch",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    color: Colors.red),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorsApp.greyblack,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: const [
                        Text("❤️",
                            style:
                                TextStyle(fontSize: 16, color: ColorsApp.gold)),
                        SizedBox(width: 4),
                        Text(
                          "15",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorsApp.greyblack,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: const [
                        Text("🕒", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 4),
                        Text(
                          "90",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ColorsApp.greyblack,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: const [
                        Text("⭐", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 4),
                        Text(
                          "7.6",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
