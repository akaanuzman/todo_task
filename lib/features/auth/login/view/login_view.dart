// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/core/components/alert/failed_alert.dart';
import 'package:todo_task/features/home/tasks/view/tasks_view.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/buttonstyle/speacial_button_style.dart';
import '../../../../core/components/text/primary_color_text.dart';
import '../../../../core/components/textformfield/bordered_text_form_field.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../products/components/background/auth_background.dart';
import '../../../../products/components/button/special_button.dart';
import '../../../../products/components/text/auth_title.dart';
import '../../register/view/register_view.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  static const path = '/login';

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String emailErrorText = "";
  String passwordErrorText = "";

  LoginView({Key? key}) : super(key: key);

  void _loginOperation(BuildContext context, LoginViewModel viewModel) async {
    await viewModel.fetchApiToken(
        emailController.text, passwordController.text);
    if (viewModel.item.token == null) {
      _showDialog(context);
    } else {
      NavigationService.pushNamed(TasksView.path);
    }
    _formKey.currentState!.validate();
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FailedAlert(
        context: context,
        content: "Wrong password or email ! \n"
            "Please try again",
      ),
    );
  }

  void get _goToRegisterPage => NavigationService.pushNamed(RegisterView.path);

  @override
  Widget build(BuildContext context) => BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
            Scaffold(
          body: _body(context, viewModel),
        ),
      );

  Widget _body(BuildContext context, LoginViewModel viewModel) => FadeInUpBig(
        child: Form(
          key: _formKey,
          child: AuthBackground(
            context: context,
            child: _centerSection(context, viewModel),
          ),
        ),
      );

  ListView _centerSection(BuildContext context, LoginViewModel viewModel) =>
      ListView(
        padding: context.paddingNormal,
        physics: const BouncingScrollPhysics(),
        children: [
          context.emptySizedHeightBoxNormal,
          _title(context),
          context.emptySizedHeightBoxLow3x,
          _image(context),
          context.emptySizedHeightBoxLow3x,
          _emailField(context, viewModel),
          context.emptySizedHeightBoxLow3x,
          _passwordField(context, viewModel),
          context.emptySizedHeightBoxLow3x,
          _signInButton(context, viewModel),
          context.emptySizedHeightBoxLow2x,
          const Divider(
            thickness: 1.5,
          ),
          _registerFields(context),
        ],
      );

  Widget _title(BuildContext context) =>
      AuthTitle(context: context, title: "LOGIN");

  SvgPicture _image(BuildContext context) => SvgPicture.asset(
        "assets/images/login.svg",
        height: context.dynamicWidth(0.55),
      );

  BorderedTextFormField _emailField(
          BuildContext context, LoginViewModel viewModel) =>
      BorderedTextFormField(
        controller: emailController,
        validator: (username) =>
            emailErrorText = viewModel.appValidator.emailCheck(username),
        context: context,
        hintText: "Your Email",
        prefixIcon: Icons.email,
        filled: true,
      );

  BorderedTextFormField _passwordField(
          BuildContext context, LoginViewModel viewModel) =>
      BorderedTextFormField(
        controller: passwordController,
        validator: (password) =>
            passwordErrorText = viewModel.appValidator.passwordCheck(password),
        context: context,
        hintText: "Your password",
        prefixIcon: Icons.lock,
        obscureText: viewModel.isShowPassword,
        filled: true,
        suffixIcon: _passwordFieldIconButton(viewModel, context),
      );

  IconButton _passwordFieldIconButton(
          LoginViewModel viewModel, BuildContext context) =>
      IconButton(
        onPressed: viewModel.showPassword,
        icon: Icon(
          Icons.remove_red_eye,
          color: context.royalPurple,
        ),
      );

  SpecialButton _signInButton(BuildContext context, LoginViewModel viewModel) =>
      SpecialButton(
        context: context,
        data: "Sign In",
        onTap: () => _loginOperation(context, viewModel),
      );

  Center _registerFields(BuildContext context) => Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
            ),
            TextButton(
              onPressed: () => _goToRegisterPage,
              child: PurpleBoldText(data: "Create account", context: context),
              style: SpecialButtonStyle(context: context),
            )
          ],
        ),
      );
}
