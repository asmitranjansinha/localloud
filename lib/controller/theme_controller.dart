import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:localloud/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  bool _isSystemTheme = true;
  bool _isDarkMode = false;
  SharedPreferences? _prefs;

  ThemeController() {
    _loadPrefs();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final window = WidgetsBinding.instance.window;
      window.onPlatformBrightnessChanged = _handlePlatformBrightnessChanged;
    });
  }

  bool get isSystemTheme => _isSystemTheme;
  bool get isDarkMode => _isDarkMode;

  // changes the theme of the app and
  // saves the value to the SharedPreferences key to keep it persistent
  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
    print("Dark Mode: $_isDarkMode");
    _savePrefs();
  }

  set isSystemTheme(bool value) {
    _isSystemTheme = value;
    // Update isDarkMode based on system theme
    if (_isSystemTheme) {
      final window = WidgetsBinding.instance.window;
      _isDarkMode = window.platformBrightness == Brightness.dark;
    }
    _savePrefs();
    notifyListeners();
  }

  void _handlePlatformBrightnessChanged() {
    if (_isSystemTheme) {
      final window = WidgetsBinding.instance.window;
      if (window.platformBrightness == Brightness.dark && !_isDarkMode) {
        _isDarkMode = true;
        _savePrefs();
        notifyListeners();
      } else if (window.platformBrightness == Brightness.light && _isDarkMode) {
        _isDarkMode = false;
        _savePrefs();
        notifyListeners();
      }
    }
  }

  // loads value of key "isDarkMode" (bool)
  _loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _isSystemTheme = _prefs?.getBool(PrefsConstants.systemTheme) ?? false;
    if (_isSystemTheme) {
      var brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      _isDarkMode = (brightness == Brightness.dark);
    } else {
      _isDarkMode = _prefs?.getBool(PrefsConstants.darkMode) ?? false;
    }
    notifyListeners();
  }

  // saves value of key "isDarkMode" (bool)
  _savePrefs() async {
    await _prefs?.setBool(PrefsConstants.systemTheme, _isSystemTheme);
    await _prefs!.setBool(PrefsConstants.darkMode, _isDarkMode);
  }
}
