import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'IRegisterService.dart';
import 'register_service_end_points.dart';

class RegisterService extends IRegisterService {
  final String rawValue = RegisterServiceEndPoints.REGISTER.rawValue;
  RegisterService(Dio dio) : super(dio);

  @override
  Future<void> postUser(String email, String password) async {
    try {
      await dio.post(
        rawValue,
        data: {"email": email, "password": password},
      );
    } on DioError catch (e) {
      debugPrint(e.response.toString());
    }
  }
}
