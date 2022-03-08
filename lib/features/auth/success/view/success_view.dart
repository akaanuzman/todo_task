import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../viewmodel/success_view_model.dart';
import '../../../../products/components/background/auth_background.dart';

class SuccessView extends StatelessWidget {
  static const path = '/success';
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<SuccessViewModel>(
        viewModel: SuccessViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SuccessViewModel viewModel) =>
            Scaffold(
          body: _body(context),
        ),
      );

  FadeInUpBig _body(BuildContext context) => FadeInUpBig(
        child: AuthBackground(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image,
              context.emptySizedHeightBoxLow3x,
              _title,
            ],
          ),
        ),
      );

  Center get _image => Center(
        child: Image.asset("assets/images/success.png"),
      );

  Center get _title => const Center(
        child: Text(
          "Successfully registered.\n"
          "You are taken to the login screen.",
          textAlign: TextAlign.center,
        ),
      );
}
