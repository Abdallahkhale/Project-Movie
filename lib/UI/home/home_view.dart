import 'package:flutter/material.dart';
import 'package:movies/Core/assets/Colors/Colors.dart';
import 'package:movies/Core/assets/images/imagesPath.dart';
import 'package:movies/UI/explore/explore_tab.dart';
import 'package:movies/UI/home/home_tab.dart';
import 'package:movies/UI/profile/profile_tab.dart';
import 'package:movies/UI/search/search_tab.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const ExploreTab(),
    const ProfileTab()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[currentIndex],
      bottomNavigationBar: Stack(children: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorsApp.greyblack,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorsApp.gold,
              unselectedItemColor: ColorsApp.white,
              currentIndex: currentIndex,
              onTap: (index) {
                if (currentIndex == index) return;
                setState(() {
                  currentIndex = index;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 28,
              items: [
                BottomNavigationBarItem(
                  icon: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      currentIndex == 0 ? ColorsApp.gold : Colors.white,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(ImagesPath.home, height: 28, width: 28),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      currentIndex == 1 ? ColorsApp.gold : Colors.white,
                      BlendMode.srcIn,
                    ),
                    child:
                        Image.asset(ImagesPath.search, height: 28, width: 28),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      currentIndex == 2 ? ColorsApp.gold : Colors.white,
                      BlendMode.srcIn,
                    ),
                    child:
                        Image.asset(ImagesPath.explore, height: 28, width: 28),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      currentIndex == 3 ? ColorsApp.gold : Colors.white,
                      BlendMode.srcIn,
                    ),
                    child:
                        Image.asset(ImagesPath.Profiel, height: 28, width: 28),
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
