import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localloud/models/user_model.dart';
import 'package:localloud/services/user_service.dart';

import '../utils/shared_preferences_helper.dart';

class UserController extends ChangeNotifier {
  final _userService = UserService();
  final _sharedPreferencesHelper = SharedPreferencesHelper();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();

  UserModel _user = UserModel();
  UserModel get user => _user;

  set user(UserModel val) {
    _user = val;
    notifyListeners();
  }

  Future<void> getUser() async {
    try {
      // Get user id from local storage
      final userId = await _sharedPreferencesHelper.getId();
      // Get user
      final user = await _userService.getUser(userId!);
      if (user != null) {
        _user = user;
        updateUserProfileFields();
      }
    } catch (e) {
      log("Error Get User: $e --> getUser(UserController)");
      rethrow;
    }
  }

  Future updateUser(UserModel user) async {
    try {
      // Get user id from local storage
      final userId = await _sharedPreferencesHelper.getId();
      // Update user
      final newUser = await _userService.updateUser(userId!, user);
      if (newUser != null) {
        _user = newUser;
        updateUserProfileFields();
      }
    } catch (e) {
      log("Error Update User: $e --> updateUser(UserController)");
      rethrow;
    }
  }

  void updateUserProfileFields() {
    nameController.text = _user.name ?? '';
    emailController.text = _user.email ?? '';
    ageController.text = _user.age.toString();
    notifyListeners();
  }

  UserController() {
    getUser();
  }
}
