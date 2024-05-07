// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:localloud/controller/auth_controller.dart';
import 'package:localloud/controller/user_controller.dart';
import 'package:localloud/views/widgets/app_button.dart';
import 'package:localloud/views/widgets/auth_field.dart';
import 'package:provider/provider.dart';

import '../utils/constants/app_assets.dart';
import '../utils/constants/app_dimensions.dart';
import '../utils/routes/routes.dart';
import '../utils/theme/theme.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthController, UserController>(
        builder: (context, authController, userController, child) {
      return Scaffold(
        backgroundColor: Colors.redAccent.shade100,
        body: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.localloudLogo,
                  scale: 6.5,
                ),
                verticalSpace(40.0),
                AuthTextField(
                  hintText: "username",
                  controller: _usernameController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Username cannot be empty!";
                    }
                    return null;
                  },
                ),
                verticalSpace(20.0),
                AuthTextField(
                  hintText: "password",
                  controller: _passwordController,
                  isPasswordField: true,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Password cannot be empty!";
                    }
                    return null;
                  },
                ),
                verticalSpace(20.0),
                AppButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      if (authController.isRegisterMode) {
                        final isLoggedIn = await authController.register(
                            _usernameController.text, _passwordController.text);
                        if (isLoggedIn) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteNames.home,
                            (route) => false,
                          );
                        }
                      } else {
                        final isLoggedIn = await authController.login(
                            _usernameController.text, _passwordController.text);
                        if (isLoggedIn) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteNames.home,
                            (route) => false,
                          );
                        }
                      }
                      userController.getUser();
                    }
                  },
                  title: authController.isRegisterMode ? "Register" : "Login",
                ),
                verticalSpace(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      authController.isRegisterMode
                          ? "Already Registered?"
                          : "Didn't registered?",
                      style: const TextStyle(
                        color: AppColors.lightBackground,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        authController.toggleRegisterMode();
                      },
                      child: Text(
                        authController.isRegisterMode ? "Login" : "Register",
                        style: const TextStyle(
                          color: AppColors.lightBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
