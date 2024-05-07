import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localloud/controller/home_controller.dart';
import 'package:localloud/utils/theme/theme.dart';
import 'package:localloud/views/post_view.dart';
import 'package:localloud/views/settings_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, homeController, child) {
      return Scaffold(
        body: homeController.currentIndex == 1 ? SettingsView() : PostView(),
        bottomNavigationBar: SizedBox(
          height: 70.0,
          child: BottomNavigationBar(
            iconSize: 20.0,
            elevation: 20.0,
            onTap: (value) {
              context.read<HomeController>().setIndex(value);
            },
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  homeController.currentIndex == 0
                      ? CupertinoIcons.paperplane_fill
                      : CupertinoIcons.paperplane,
                  color: AppColors.primary,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  homeController.currentIndex == 1
                      ? CupertinoIcons.gear_solid
                      : CupertinoIcons.gear,
                  color: AppColors.primary,
                ),
                label: "",
              ),
            ],
          ),
        ),
      );
    });
  }
}
