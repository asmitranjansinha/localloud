import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localloud/controller/theme_controller.dart';
import 'package:localloud/utils/constants/app_assets.dart';
import 'package:localloud/views/widgets/post_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeAppBar = AppBar(
      elevation: 2.0,
      leading: const Icon(
        CupertinoIcons.search_circle_fill,
        color: Colors.white,
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
              context.read<ThemeController>().isDarkMode
                  ? AppIcons.nightMode
                  : AppIcons.sunMode,
              color: context.read<ThemeController>().isDarkMode
                  ? Colors.white
                  : null,
            ),
          ),
        )
      ],
    );
    return Scaffold(
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
      appBar: homeAppBar,
    );
  }
}
