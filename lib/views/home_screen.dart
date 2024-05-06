import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localloud/controller/home_controller.dart';
import 'package:localloud/controller/theme_controller.dart';
import 'package:localloud/utils/constants/app_assets.dart';
import 'package:localloud/utils/theme/theme.dart';
import 'package:localloud/views/user_profile_view.dart';
import 'package:localloud/views/widgets/post_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeController, HomeController>(
        builder: (context, themeController, homeController, child) {
      return Scaffold(
        body: homeController.currentIndex == 1
            ? UserProfileView()
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PostCard();
                      }),
                ),
              ),
        appBar: AppBar(
          elevation: 2.0,
          leading: Icon(
            CupertinoIcons.search_circle_fill,
            color: themeController.isDarkMode ? Colors.white : Colors.black,
          ),
          centerTitle: true,
          title: Image.asset(
            AppIcons.localloudLogo,
            scale: 18.0,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  context.read<ThemeController>().isDarkMode =
                      !context.read<ThemeController>().isDarkMode;
                },
                child: SvgPicture.asset(
                  themeController.isDarkMode
                      ? AppIcons.nightMode
                      : AppIcons.sunMode,
                  color:
                      themeController.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            )
          ],
        ),
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
                CupertinoIcons.person_alt_circle,
                color: AppColors.primary,
              ),
              activeIcon: Icon(
                CupertinoIcons.person_alt_circle_fill,
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
