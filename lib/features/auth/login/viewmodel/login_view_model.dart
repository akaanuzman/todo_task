import '../../../../core/base/viewmodel/base_view_model.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

class LoginViewModel extends BaseViewModel {
  late final ILoginService loginService;
  LoginModel item = LoginModel();
  bool isShowPassword = true;

  @override
  void init() {
    loginService = LoginService(networkManager.dio);
  }

  void fetchApiToken(String email, String password) async {
    item = await loginService.fetchApiToken(email, password);
    setState();
  }

  void showPassword() {
    isShowPassword = !isShowPassword;
    setState();
  }
}
