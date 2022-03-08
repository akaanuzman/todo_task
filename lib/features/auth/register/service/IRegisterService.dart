// ignore_for_file: file_names

import 'package:dio/dio.dart';

abstract class IRegisterService {
  final Dio dio;

  IRegisterService(this.dio);

  Future<void> postUser(String email, String password);
}
