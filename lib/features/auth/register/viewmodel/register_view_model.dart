import 'package:todo_task/features/auth/register/service/register_service.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../service/IRegisterService.dart';

class RegisterViewModel extends BaseViewModel {
  late final IRegisterService registerService;

  @override
  void init() {
    registerService = RegisterService(networkManager.dio);
  }

  Future<void> postUser(String email, String password) async {
    await registerService.postUser(email, password);
    setState();
  }
}
