// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:todo_task/features/auth/register/model/register_model.dart';

abstract class IRegisterService {
  final Dio dio;

  IRegisterService(this.dio);

  Future<RegisterModel> postUser(String email, String password);
}
