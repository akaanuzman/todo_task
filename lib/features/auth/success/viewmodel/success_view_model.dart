import 'dart:async';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../login/view/login_view.dart';

class SuccessViewModel extends BaseViewModel {
  @override
  void init() {
    Timer(context.durationHighSlow, goToLoginPage);
  }

  void goToLoginPage() => NavigationService.pushNamed(LoginView.path);
}
