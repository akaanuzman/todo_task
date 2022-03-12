import '../../../../core/base/viewmodel/base_view_model.dart';
import '../model/register_model.dart';
import '../service/IRegisterService.dart';
import '../service/register_service.dart';

class RegisterViewModel extends BaseViewModel {
  late final IRegisterService registerService;
  RegisterModel item = RegisterModel();

  @override
  void init() {
    registerService = RegisterService(networkManager.dio);
  }

  Future<void> postUser(String email, String password) async {
    item = await registerService.postUser(email, password);
    setState();
  }
}
