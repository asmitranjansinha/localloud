import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {

  bool _isRegisterMode = false;
  bool get isRegisterMode => _isRegisterMode;

  set isRegisterMode(bool val) {
    _isRegisterMode = val;
    notifyListeners();
  }

}