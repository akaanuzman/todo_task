import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../extensions/app_extensions.dart';

import '../../../products/components/button/special_button.dart';
import '../../init/navigation/navigation_service.dart';

class LoginFailed extends AlertDialog {
  LoginFailed({Key? key, required BuildContext context})
      : super(
          key: key,
          shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
          title: _errorIcon(context),
          content: _content,
          actions: [
            _button(context),
          ],
        );

  static FlipInY _errorIcon(BuildContext context) => FlipInY(
        child: CircleAvatar(
          backgroundColor: context.red,
          child: Icon(
            Icons.error,
            color: context.background,
          ),
        ),
      );

  static FlipInY get _content => FlipInY(
        child: const Text("Wrong email or password please try again !"),
      );

  static FlipInY _button(BuildContext context) => FlipInY(
        child: SpecialButton(
          context: context,
          data: "Ok",
          onTap: () => NavigationService.pop(),
          backgroundColor: context.primaryColor,
        ),
      );
}
