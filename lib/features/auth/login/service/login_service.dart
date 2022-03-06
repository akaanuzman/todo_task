import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/login_model.dart';
import 'ILoginService.dart';
import 'login_service_end_points.dart';

class LoginService extends ILoginService {
  final String rawValue = LoginServiceEndPoints.LOGIN.rawValue;
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginModel> fetchApiToken(String email, String password) async {
    try {
      final response = await dio.post(
        rawValue,
        data: {
          "email": "utku.kapoglu@apmsoft.net",
          "password": "123456"
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        debugPrint(data.toString());
        return LoginModel();
      }
      return LoginModel();
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return LoginModel();
    }
  }
}
