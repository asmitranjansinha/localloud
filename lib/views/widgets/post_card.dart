import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localloud/controller/post_controller.dart';
import 'package:localloud/models/post_model.dart';
import 'package:localloud/utils/constants/app_dimensions.dart';
import 'package:localloud/utils/theme/theme.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

import '../../controller/theme_controller.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeController, PostController>(
        builder: (context, themeController, postController, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color:
                themeController.isDarkMode ? AppColors.lessDark : Colors.white,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
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
                        "@${post.user!.username!}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 13.0,
                            ),
                      ),
                      Text(
                        'Few minutes ago',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 10.0,
                            ),
                      ),
                    ],
                  ),
                  Builder(builder: (context) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => showPopover(
                        context: context,
                        backgroundColor: Colors.grey[500]!,
                        bodyBuilder: (context) => InkWell(
                          onTap: () {
                            postController.deletePost(post.id!);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text("Delete"),
                          ),
                        ),
                        direction: PopoverDirection.bottom,
                        width: 150,
                        height: 50,
                      ),
                      child: const Icon(
                        CupertinoIcons.ellipsis_circle_fill,
                        size: 20.0,
                      ),
                    );
                  }),
                ],
              ),
              verticalSpace(10.0),
              Text(
                post.postContent!,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      postController.upVotePost(post.id!);
                    },
                    icon: Row(children: [
                      const Icon(
                        CupertinoIcons.up_arrow,
                        size: 15.0,
                      ),
                      Text(
                        post.upvotes.toString(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12.0,
                            ),
                      )
                    ]),
                  ),
                  IconButton(
                    onPressed: () {
                      postController.downVotePost(post.id!);
                    },
                    icon: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.down_arrow,
                          size: 15.0,
                        ),
                        Text(
                          post.downvotes.toString(),
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12.0,
                                  ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
