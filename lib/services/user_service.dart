import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:localloud/models/user_model.dart';
import 'package:localloud/utils/constants/api_constant.dart';

class UserService {
  final _apiConst = ApiConstant();

  Map<String, dynamic>? headers = {
    'Content-Type': 'application/json',
  };

  Future<UserModel?> getUser(int id) async {
    try {
      Response response = await _apiConst.sendApiReq.get(
        '/user/$id',
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log("Error Get User: $e --> getUser(UserService)");
      rethrow;
    }
  }

  Future<UserModel?> updateUser(int id, UserModel user) async {
    try {
      Response response = await _apiConst.sendApiReq.put(
        '/user/$id',
        data: {
          "name": user.name,
          "email": user.email,
          "age": user.age,
        },
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log("Error Update User: $e --> updateUser(UserService)");
      rethrow;
    }
  }
}
