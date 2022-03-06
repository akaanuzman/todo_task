import '../../../../core/base/viewmodel/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  
  bool isShowPassword = true;

  @override
  void init() {}

  void showPassword() {
    isShowPassword = !isShowPassword;
    setState();
  }
}
