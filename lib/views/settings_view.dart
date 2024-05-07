// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localloud/controller/auth_controller.dart';
import 'package:localloud/controller/theme_controller.dart';
import 'package:localloud/controller/user_controller.dart';
import 'package:localloud/models/user_model.dart';
import 'package:localloud/utils/constants/app_dimensions.dart';
import 'package:localloud/utils/routes/routes.dart';
import 'package:localloud/utils/theme/theme.dart';
import 'package:localloud/views/widgets/app_button.dart';
import 'package:localloud/views/widgets/auth_field.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer3<ThemeController, AuthController, UserController>(builder:
        (context, themeController, authController, userController, child) {
      return Scaffold(
        // App Bar
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "SETTINGS",
            style: TextStyle(
              color:
                  themeController.isDarkMode ? AppColors.light : AppColors.dark,
            ),
          ),
        ),
        // Body
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sections(context, "USER PROFILE"),
              verticalSpace(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthTextField(
                        hintText: "name",
                        controller: userController.nameController,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Name cannot be empty!";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10.0),
                      AuthTextField(
                        hintText: "email",
                        controller: userController.emailController,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Email cannot be empty!";
                          }
                          return null;
                        },
                      ),
                      verticalSpace(10.0),
                      Row(
                        children: [
                          SizedBox(
                            width: 140.0,
                            child: AuthTextField(
                              hintText: "age",
                              controller: userController.ageController,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Age cannot be empty!";
                                }
                                return null;
                              },
                            ),
                          ),
                          horizontalSpace(50.0),
                          AppButton(
                            title: "Save",
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                userController.updateUser(
                                  UserModel(
                                    name: userController.nameController.text,
                                    email: userController.emailController.text,
                                    age: int.parse(
                                        userController.ageController.text),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(20.0),
              _sections(context, "APPEARANCE"),
              verticalSpace(10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Dark Mode"),
                    CupertinoSwitch(
                      value: themeController.isDarkMode,
                      onChanged: (value) {
                        themeController.isDarkMode = value;
                      },
                      activeColor: AppColors.dark,
                    )
                  ],
                ),
              ),
              verticalSpace(20.0),
              _sections(context, "OTHERS"),
              verticalSpace(10.0),
              TextButton(
                child: Text(
                  "Logout ->",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                onPressed: () async {
                  final isLoggedOut = await authController.logout();
                  if (isLoggedOut) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RouteNames.login,
                      (route) => false,
                    );
                  }
                },
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _sections(context, String sectionName) {
    return Row(
      children: [
        Text(
          sectionName,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 10.0,
              ),
        ),
        horizontalSpace(5.0),
        const Expanded(child: Divider()),
      ],
    );
  }
}
