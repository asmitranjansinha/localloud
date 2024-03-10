import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localloud/utils/constants/app_dimensions.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('AskLocalLoud'),
                      Text('3 hours ago'),
                    ],
                  ),
                  Icon(Icons.more_horiz_outlined)
                ],
              ),
              verticalSpace(10.0),
              const Text(
                  'What is the most awkward live television moment that you are aware of?'),
              const Row(
                children: [
                  Text('From'),
                  Text('LonelyRegister'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
