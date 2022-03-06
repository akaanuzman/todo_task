// ignore_for_file: file_names

import 'package:dio/dio.dart';

import '../model/login_model.dart';


abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  Future<LoginModel> fetchApiToken(String email,String password);
}