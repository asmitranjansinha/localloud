import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localloud/controller/home_controller.dart';
import 'package:localloud/controller/theme_controller.dart';
import 'package:localloud/utils/theme/theme.dart';
import 'package:localloud/views/post_view.dart';
import 'package:localloud/views/settings_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeController, HomeController>(
        builder: (context, themeController, homeController, child) {
      return Scaffold(
        body: homeController.currentIndex == 1 ? SettingsView() : PostView(),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10.0,
          onTap: (value) {
            context.read<HomeController>().setIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppColors.primary,
              ),
              activeIcon: Icon(
                Icons.home_filled,
                color: AppColors.primary,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.gear_solid,
                color: AppColors.primary,
              ),
              activeIcon: Icon(
                CupertinoIcons.gear_solid,
                color: AppColors.primary,
              ),
              label: "",
            ),
          ],
          backgroundColor: themeController.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground,
        ),
      );
    });
  }
}
