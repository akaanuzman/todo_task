// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/core/components/alert/failed_alert.dart';
import 'package:todo_task/features/auth/success/view/success_view.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/textformfield/bordered_text_form_field.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../products/components/background/auth_background.dart';
import '../../../../products/components/button/special_button.dart';
import '../../../../products/components/text/auth_title.dart';
import '../viewmodel/register_view_model.dart';

class RegisterView extends StatelessWidget {
  static const path = '/register';

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String emailErrorText = "";
  String passwordErrorText = "";

  RegisterView({Key? key}) : super(key: key);

  void _registerOperation(
      BuildContext context, RegisterViewModel viewModel) async {
    await viewModel.postUser(emailController.text, passwordController.text);
    if (viewModel.item.email == null || viewModel.item.password == null) {
      _showDialog(context);
      _formKey.currentState!.validate();
    } else {
      NavigationService.pushNamed(SuccessView.path);
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FailedAlert(
        context: context,
        content: "This email is in use or invalid.\n"
            "Please try again !",
      ),
    );
  }

  @override
  Widget build(BuildContext context) => BaseView<RegisterViewModel>(
        viewModel: RegisterViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, RegisterViewModel viewModel) =>
            Scaffold(
          body: _body(context, viewModel),
        ),
      );

  Widget _body(BuildContext context, RegisterViewModel viewModel) =>
      FadeInUpBig(
        child: Form(
          key: _formKey,
          child: AuthBackground(
            context: context,
            child: _centerSection(context, viewModel),
          ),
        ),
      );

  ListView _centerSection(BuildContext context, RegisterViewModel viewModel) =>
      ListView(
        padding: context.paddingNormal,
        physics: const BouncingScrollPhysics(),
        children: [
          context.emptySizedHeightBoxNormal,
          _title(context),
          _image(context),
          context.emptySizedHeightBoxNormal,
          _nameField(context),
          context.emptySizedHeightBoxLow3x,
          _emailField(context, viewModel),
          context.emptySizedHeightBoxLow3x,
          _passwordField(context, viewModel),
          context.emptySizedHeightBoxLow3x,
          SpecialButton(
            context: context,
            data: "Register",
            onTap: () => _registerOperation(context,viewModel),
          )
        ],
      );

  AuthTitle _title(BuildContext context) =>
      AuthTitle(context: context, title: "REGISTER");

  SvgPicture _image(BuildContext context) => SvgPicture.asset(
        "assets/images/signup.svg",
        height: context.dynamicWidth(0.55),
      );

  BorderedTextFormField _nameField(BuildContext context) =>
      BorderedTextFormField(
        context: context,
        hintText: "Enter your name...",
        prefixIcon: Icons.person,
        filled: true,
      );

  BorderedTextFormField _emailField(
          BuildContext context, RegisterViewModel viewModel) =>
      BorderedTextFormField(
        controller: emailController,
        validator: (username) =>
            emailErrorText = viewModel.appValidator.emailCheck(username),
        context: context,
        hintText: "Enter your email...",
        prefixIcon: Icons.email,
        filled: true,
      );

  BorderedTextFormField _passwordField(
          BuildContext context, RegisterViewModel viewModel) =>
      BorderedTextFormField(
        controller: passwordController,
        validator: (password) =>
            passwordErrorText = viewModel.appValidator.passwordCheck(password),
        context: context,
        hintText: "Enter your password...",
        prefixIcon: Icons.lock,
        filled: true,
        obscureText: true,
      );
}
