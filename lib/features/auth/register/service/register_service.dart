import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/register_model.dart';
import 'IRegisterService.dart';
import 'register_service_end_points.dart';

class RegisterService extends IRegisterService {
  final String rawValue = RegisterServiceEndPoints.REGISTER.rawValue;
  RegisterService(Dio dio) : super(dio);

  @override
  Future<RegisterModel> postUser(String email, String password) async {
    try {
      final response = await dio.post(
        rawValue,
        data: {"email": email, "password": password},
      );

      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        debugPrint(data.toString());
        debugPrint("key-value: ${data['name']}");
        return RegisterModel(
          name: data['name'],
          email: data['email'],
          password: data['password'],
        );
      }
      return RegisterModel();
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return RegisterModel();
    }
  }
}
