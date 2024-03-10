import 'package:flutter/material.dart';
import 'package:localloud/utils/constants/app_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppIcons.localloudLogo),
    );
  }
}