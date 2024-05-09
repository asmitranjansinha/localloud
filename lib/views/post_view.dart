// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localloud/controller/post_controller.dart';
import 'package:localloud/models/post_model.dart';
import 'package:localloud/utils/constants/app_dimensions.dart';
import 'package:localloud/utils/theme/theme.dart';
import 'package:localloud/views/widgets/app_button.dart';
import 'package:localloud/views/widgets/auth_field.dart';
import 'package:localloud/views/widgets/post_card.dart';
import 'package:provider/provider.dart';

import '../utils/constants/app_assets.dart';

class PostView extends StatelessWidget {
  PostView({super.key});

  final _contentController = TextEditingController();

  final _questionController = TextEditingController();
  final _optionAController = TextEditingController();
  final _optionBController = TextEditingController();
  final _optionCController = TextEditingController();
  final _optionDController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<PostController>(builder: (context, postController, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          centerTitle: true,
          title: Image.asset(
            AppIcons.localloudLogo,
            scale: 18.0,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: postController.posts.isEmpty
                ? const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "No one posted anything.\nTry posting something!",
                      textAlign: TextAlign.center,
                    ))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: postController.posts.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      log("Posts --> ${postController.posts.length}");
                      return PostCard(
                        post: postController.posts[index],
                      );
                    }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return Consumer<PostController>(
                    builder: (context, controller, child) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.postType = "post";
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.postType == "post"
                                        ? AppColors.red
                                        : AppColors.slightRed,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "ADD POST",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ),
                              ),
                              horizontalSpace(20.0),
                              InkWell(
                                onTap: () {
                                  controller.postType = "poll";
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.postType == "poll"
                                        ? AppColors.red
                                        : AppColors.slightRed,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "ADD POLL",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(20.0),
                          controller.postType == "poll"
                              ? Column(
                                  children: [
                                    AuthTextField(
                                      hintText: "Ask your question",
                                      controller: _questionController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Question cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                    verticalSpace(20.0),
                                    AuthTextField(
                                      hintText: "Option A",
                                      controller: _optionAController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Option 1 cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                    verticalSpace(20.0),
                                    AuthTextField(
                                      hintText: "Option B",
                                      controller: _optionBController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Option 2 cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                    verticalSpace(20.0),
                                    AuthTextField(
                                      hintText: "Option C",
                                      controller: _optionCController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Option 3 cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                    verticalSpace(20.0),
                                    AuthTextField(
                                      hintText: "Option D",
                                      controller: _optionDController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Option 4 cannot be empty";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                )
                              : AuthTextField(
                                  hintText: "Write Something Here...",
                                  controller: _contentController,
                                  maxLine: 5,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Content cannot be empty";
                                    }
                                    return null;
                                  },
                                ),
                          verticalSpace(20.0),
                          AppButton(
                            title: "Post",
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                if (controller.postType == "poll") {
                                  final isPosted =
                                      await postController.createPoll(
                                    PostModel(
                                      postContent: _questionController.text,
                                      pollA: _optionAController.text,
                                      pollB: _optionBController.text,
                                      pollC: _optionCController.text,
                                      pollD: _optionDController.text,
                                    ),
                                  );
                                  if (isPosted) {
                                    Navigator.pop(context);
                                  }
                                } else {
                                  final isPosted = await postController
                                      .createPost(_contentController.text);
                                  if (isPosted) {
                                    Navigator.pop(context);
                                  }
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            );
          },
        ),
      );
    });
  }
}
