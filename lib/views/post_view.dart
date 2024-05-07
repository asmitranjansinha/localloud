// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:localloud/controller/post_controller.dart';
import 'package:localloud/utils/constants/app_dimensions.dart';
import 'package:localloud/views/widgets/app_button.dart';
import 'package:localloud/views/widgets/auth_field.dart';
import 'package:localloud/views/widgets/post_card.dart';
import 'package:provider/provider.dart';

import '../utils/constants/app_assets.dart';

class PostView extends StatelessWidget {
  PostView({super.key});

  final _contentController = TextEditingController();
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
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: postController.posts.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
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
                        Text(
                          "ADD POST",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        verticalSpace(20.0),
                        AuthTextField(
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
                              final isPosted = await postController
                                  .createPost(_contentController.text);
                              if (isPosted) {
                                Navigator.pop(context);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    });
  }
}
