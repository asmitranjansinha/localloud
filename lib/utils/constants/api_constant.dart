import 'package:dio/dio.dart';

class ApiConstant {
  final _dio = Dio();

  ApiConstant() {
    _dio.options.baseUrl = "http://localhost:3000/api";
  }

  Dio get sendApiReq => _dio;
}
