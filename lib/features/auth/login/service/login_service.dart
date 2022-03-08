import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/login_model.dart';
import 'ILoginService.dart';
import 'login_service_end_points.dart';

class LoginService extends ILoginService {
  final iosOptions =
      const IOSOptions(accessibility: IOSAccessibility.first_unlock);
  final androidOptions = const AndroidOptions(encryptedSharedPreferences: true);

  final String rawValue = LoginServiceEndPoints.LOGIN.rawValue;

  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginModel> fetchApiToken(String email, String password) async {
    final storage =
        FlutterSecureStorage(iOptions: iosOptions, aOptions: androidOptions);

    try {
      final response = await dio.post(
        rawValue,
        data: {"email": email, "password": password},
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        debugPrint(data.toString());
        await storage.write(
          key: 'token',
          value: data['token'],
          iOptions: iosOptions,
          aOptions: androidOptions,
        );
        debugPrint("storage read: ${storage.read(key: 'token')}");
        return LoginModel(
          token: data['token'],
        );
      }
      return LoginModel();
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return LoginModel();
    }
  }
}
