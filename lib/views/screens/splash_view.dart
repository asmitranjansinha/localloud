// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:localloud/controller/auth_controller.dart';
import 'package:localloud/utils/constants/app_assets.dart';
import 'package:localloud/utils/routes/routes.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLoggedIn = false;

  checkToken() async {
    isLoggedIn = await context.read<AuthController>().checkToken();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await checkToken();
    if (isLoggedIn) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.home,
        (route) => false,
      );
      return;
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.login,
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.localloudLogo,
              scale: 6.5,
            ),
          ],
        ),
      ),
    );
  }
}
