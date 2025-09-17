import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';
import 'package:movies/UI/authentication/login_view.dart';
import 'package:movies/UI/profile/Widgets/Custom_button.dart';
import 'package:movies/UI/profile/Widgets/custom_label_image.dart';
import 'package:movies/UI/profile/Widgets/custom_label_text.dart';
import 'package:movies/UI/profile/update_profile.dart';

class ProfileTab extends StatelessWidget {
  static const String routeName = "profile-tab";
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: height * 0.35,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CustomLabelImage(),
                          CustomLabelText(number: 120, label: "Washlist"),
                          CustomLabelText(number: 10, label: "History"),
                        ]),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomButton(
                              backgroundColor: ColorsApp.gold,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, UpdateProfile.routeName);
                              },
                              child: Text(
                                "Edit profile",
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        const SizedBox(width: 16),
                        CustomButton(
                            backgroundColor: ColorsApp.red,
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                context, LoginView.routeName, (route) => false),
                            child: const Row(
                              children: [
                                Text(
                                  "Exit",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.exit_to_app_rounded,
                                    color: Colors.white, size: 16)
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      indicatorColor: ColorsApp.gold,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: "Watch List",
                          icon: Icon(
                            Icons.list_outlined,
                            color: ColorsApp.gold,
                          ),
                        ),
                        Tab(
                          text: "History",
                          icon: Icon(
                            Icons.folder,
                            color: ColorsApp.gold,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Image.asset(
                            ImagesPath.body,
                            width: 200,
                            height: 200,
                          ),
                          Image.asset(
                            ImagesPath.body,
                            width: 200,
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
