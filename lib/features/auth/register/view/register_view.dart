import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/register_view_model.dart';
import '../../../../products/components/background/auth_background.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../products/components/button/special_button.dart';
import '../../../../products/components/text/auth_title.dart';
import '../../../../core/components/textformfield/bordered_text_form_field.dart';

class RegisterView extends StatelessWidget {
  static const path = '/register';
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<RegisterViewModel>(
        viewModel: RegisterViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, RegisterViewModel viewModel) =>
            Scaffold(
          body: _body(context),
        ),
      );

  AuthBackground _body(BuildContext context) => AuthBackground(
        context: context,
        child: _centerSection(context),
      );

  FadeInUpBig _centerSection(BuildContext context) => FadeInUpBig(
        child: ListView(
          padding: context.paddingNormal,
          physics: const BouncingScrollPhysics(),
          children: [
            context.emptySizedHeightBoxNormal,
            _title(context),
            _image(context),
            context.emptySizedHeightBoxNormal,
            _emailField(context),
            context.emptySizedHeightBoxLow3x,
            _passwordField(context),
            context.emptySizedHeightBoxLow3x,
            SpecialButton(context: context, data: "Register")
          ],
        ),
      );

  AuthTitle _title(BuildContext context) =>
      AuthTitle(context: context, title: "REGISTER");

  SvgPicture _image(BuildContext context) => SvgPicture.asset(
        "assets/images/signup.svg",
        height: context.dynamicWidth(0.55),
      );

  BorderedTextFormField _emailField(BuildContext context) =>
      BorderedTextFormField(
        context: context,
        hintText: "Enter your email...",
        prefixIcon: Icons.email,
        filled: true,
      );

  BorderedTextFormField _passwordField(BuildContext context) =>
      BorderedTextFormField(
        context: context,
        hintText: "Enter your password...",
        prefixIcon: Icons.lock,
        filled: true,
        obscureText: true,
      );
}
