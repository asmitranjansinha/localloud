import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:localloud/utils/constants/api_constant.dart';

class AuthService {
  final _apiConst = ApiConstant();

  Map<String, dynamic>? headers = {
    'Content-Type': 'application/json',
  };

  Future<List?> login(String username, String password) async {
    try {
      Response response = await _apiConst.sendApiReq.post(
        '/auth/login',
        data: {
          'username': username,
          'password': password,
        },
        options: Options(headers: headers),
      );
      if (response.statusCode == 201) {
        final accessToken = response.data['access_token'];
        final userId = response.data['id'];
        return [accessToken, userId];
      }
      return null;
    } catch (e) {
      log("Error Login: $e --> login(AuthService)");
      rethrow;
    }
  }

  Future<List?> register(String username, String password) async {
    try {
      Response response = await _apiConst.sendApiReq.post(
        '/auth/register',
        data: {
          'username': username,
          'password': password,
        },
        options: Options(headers: headers),
      );
      if (response.statusCode == 201) {
        final accessToken = response.data['access_token'];
        final userId = response.data['id'];
        return [accessToken, userId];
      }
      return null;
    } catch (e) {
      log("Error Register: $e --> register(AuthService)");
      rethrow;
    }
  }
}
