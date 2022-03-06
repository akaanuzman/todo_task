import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/buttonstyle/speacial_button_style.dart';
import '../../../../core/components/text/headline6_text.dart';
import '../../../../core/components/text/primary_color_text.dart';
import '../../../../core/components/textformfield/bordered_text_form_field.dart';
import '../../../../products/components/background/auth_background.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../products/components/button/special_button.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
            Scaffold(
          backgroundColor: context.secondaryBackground,
          body: _body(context, viewModel),
        ),
      );

  AuthBackground _body(BuildContext context, LoginViewModel viewModel) =>
      AuthBackground(
        context: context,
        bottomImage: "assets/backgrounds/login_bottom.png",
        child: _centerField(context, viewModel),
      );

  FadeInUpBig _centerField(BuildContext context, LoginViewModel viewModel) =>
      FadeInUpBig(
        child: ListView(
          padding: context.paddingNormal,
          physics: const BouncingScrollPhysics(),
          children: [
            context.emptySizedHeightBoxNormal,
            _title(context),
            context.emptySizedHeightBoxLow3x,
            _image(context),
            context.emptySizedHeightBoxLow3x,
            _emailField(context),
            context.emptySizedHeightBoxLow3x,
            _passwordField(context, viewModel),
            context.emptySizedHeightBoxLow3x,
            _signInButton(context),
            context.emptySizedHeightBoxLow2x,
            const Divider(
              thickness: 1.5,
            ),
            _registerFields(context),
          ],
        ),
      );

  Padding _title(BuildContext context) => Padding(
        padding: context.paddingNormal,
        child: Center(
          child: Headline6Text(
            data: "LOGIN",
            context: context,
          ),
        ),
      );

  SvgPicture _image(BuildContext context) => SvgPicture.asset(
        "assets/images/login.svg",
        height: context.dynamicWidth(0.55),
      );

  BorderedTextFormField _emailField(BuildContext context) =>
      BorderedTextFormField(
        context: context,
        hintText: "Your Email",
        prefixIcon: Icons.email,
        filled: true,
      );

  BorderedTextFormField _passwordField(
          BuildContext context, LoginViewModel viewModel) =>
      BorderedTextFormField(
        context: context,
        hintText: "Your password",
        prefixIcon: Icons.lock,
        obscureText: viewModel.isShowPassword,
        filled: true,
        suffixIcon: IconButton(
          onPressed: viewModel.showPassword,
          icon: Icon(
            Icons.remove_red_eye,
            color: context.royalPurple,
          ),
        ),
      );

  SpecialButton _signInButton(BuildContext context) => SpecialButton(
        context: context,
        data: "Sign In",
      );

  Center _registerFields(BuildContext context) => Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
            ),
            TextButton(
              onPressed: () {},
              child: PurpleBoldText(data: "Create account", context: context),
              style: SpecialButtonStyle(context: context),
            )
          ],
        ),
      );
}
