import 'package:flutter/material.dart';
import 'package:localloud/utils/constants/app_assets.dart';
import 'package:localloud/utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.login,
      (route) => false,
    );
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
