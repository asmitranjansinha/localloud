import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _kToken = '_kToken';

  Future setToken(String token) async {
    await SharedPreferences.getInstance().then((value) {
      value.setString(_kToken, token);
      return value;
    });
  }

  Future<String?> getToken() async {
    return await SharedPreferences.getInstance().then((value) {
      return value.getString(_kToken);
    });
  }

  Future removeToken() async {
    await SharedPreferences.getInstance().then((value) {
      value.remove(_kToken);
    });
  }
}
