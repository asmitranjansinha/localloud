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
                        post.user?.username != ""
                            ? "@${post.user!.username}"
                            : "@LocalLoudBot",
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
              verticalSpace(10.0),
              post.isPoll!
                  ? Column(
                      children: [
                        _polls(post.pollA!, () {
                          postController.votePoll(post.id!, 'A');
                        }, post.pollAVotes != 0),
                        verticalSpace(5.0),
                        _polls(post.pollB!, () {
                          postController.votePoll(post.id!, 'B');
                        }, post.pollBVotes != 0),
                        verticalSpace(5.0),
                        _polls(post.pollC!, () {
                          postController.votePoll(post.id!, 'C');
                        }, post.pollCVotes != 0),
                        verticalSpace(5.0),
                        _polls(post.pollD!, () {
                          postController.votePoll(post.id!, 'D');
                        }, post.pollDVotes != 0),
                      ],
                    )
                  : const SizedBox.shrink(),
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

  Widget _polls(String options, void Function()? onTap, bool enabled) {
    return InkWell(
        onTap: onTap,
        child: Row(
          children: [
            TickerMode(
              enabled: enabled,
              child: Icon(
                enabled ? CupertinoIcons.circle_fill : CupertinoIcons.circle,
                color: enabled ? AppColors.green : null,
              ),
            ),
            horizontalSpace(5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  options,
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                verticalSpace(2.0),
                Container(
                  height: 5.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: enabled ? AppColors.green : Colors.white,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
