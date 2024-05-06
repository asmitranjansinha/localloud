import 'package:flutter/material.dart';
import 'package:localloud/utils/constants/app_dimensions.dart';
import 'package:localloud/utils/theme/theme.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _style = TextStyle(color: AppColors.dark);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AskLocalLoud',
                        style: _style,
                      ),
                      Text(
                        '3 hours ago',
                        style: _style,
                      ),
                    ],
                  ),
                  Icon(Icons.more_horiz_outlined)
                ],
              ),
              verticalSpace(10.0),
              Text(
                'What is the most awkward live television moment that you are aware of?',
                style: _style,
              ),
              Row(
                children: [
                  Text(
                    'From',
                    style: _style,
                  ),
                  Text(
                    'LonelyRegister',
                    style: _style,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
