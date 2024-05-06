import 'package:flutter/material.dart';
import 'package:localloud/utils/theme/theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const AppButton({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(60.0),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Center(
            child: Text(title),
          )),
    );
  }
}
