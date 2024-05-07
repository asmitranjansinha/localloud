import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _kToken = '_kToken';
  static const String _kId = '_id';

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

  Future setId(int id) async {
    await SharedPreferences.getInstance().then((value) {
      value.setInt(_kId, id);
      return value;
    });
  }

  Future<int?> getId() async {
    return await SharedPreferences.getInstance().then((value) {
      return value.getInt(_kId);
    });
  }

  Future removeAll() async {
    await SharedPreferences.getInstance().then((value) {
      value.clear();
    });
  }
}
