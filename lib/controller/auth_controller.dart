import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localloud/services/auth_service.dart';

import '../utils/shared_preferences_helper.dart';

class AuthController extends ChangeNotifier {
  final _authService = AuthService();
  final _sharedPreferencesHelper = SharedPreferencesHelper();

  bool _isRegisterMode = false;
  bool get isRegisterMode => _isRegisterMode;

  set isRegisterMode(bool val) {
    _isRegisterMode = val;
    notifyListeners();
  }

  void toggleRegisterMode() {
    _isRegisterMode = !_isRegisterMode;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    isLoading = true;
    try {
      final accessToken = await _authService.login(username, password);
      if (accessToken != null) {
        _sharedPreferencesHelper.setToken(accessToken);
        return true;
      }
      return false;
    } catch (e) {
      log("Error Login: $e --> login(AuthController)");
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<bool> register(String email, String password) async {
    isLoading = true;
    try {
      final accessToken = await _authService.register(email, password);
      if (accessToken != null) {
        _sharedPreferencesHelper.setToken(accessToken);
        return true;
      }
      return false;
    } catch (e) {
      log("Error Register: $e --> register(AuthController)");
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> logout() async {
    isLoading = true;
    try {
      await _sharedPreferencesHelper.removeToken();
    } catch (e) {
      log("Error Logout: $e --> logout(AuthController)");
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<bool> checkToken() async {
    isLoading = true;
    try {
      final token = await _sharedPreferencesHelper.getToken();
      if (token != null) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error Check Token: $e --> checkToken(AuthController)");
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
