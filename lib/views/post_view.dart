import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localloud/controller/theme_controller.dart';
import 'package:localloud/views/widgets/post_card.dart';
import 'package:provider/provider.dart';

import '../utils/constants/app_assets.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
        builder: (context, themeController, child) {
      return Scaffold(
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
        body: SingleChildScrollView(
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
      );
    });
  }
}
