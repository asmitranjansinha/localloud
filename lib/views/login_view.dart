import 'package:flutter/material.dart';
import 'package:localloud/controller/auth_controller.dart';
import 'package:localloud/views/widgets/auth_field.dart';
import 'package:provider/provider.dart';

import '../utils/constants/app_assets.dart';
import '../utils/constants/app_dimensions.dart';
import '../utils/theme/theme.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, authController, child) {
      return Scaffold(
        backgroundColor: Colors.redAccent.shade100,
        body: Padding(
          padding: const EdgeInsets.all(38.0),
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
              ),
              verticalSpace(20.0),
              AuthTextField(
                hintText: "password",
                controller: _passwordController,
                isPasswordField: true,
              ),
              verticalSpace(20.0),
              ElevatedButton(
                onPressed: () async {
                  await Future.delayed(const Duration(milliseconds: 500))
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Check your network connection and try again!'),
                      ),
                    );
                  });
                },
                child:
                    Text(authController.isRegisterMode ? "Register" : "Login"),
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
                      authController.isRegisterMode =
                          !authController.isRegisterMode;
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
      );
    });
  }
}
