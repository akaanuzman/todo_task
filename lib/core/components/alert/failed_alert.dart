import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../products/components/button/special_button.dart';
import '../../extensions/app_extensions.dart';
import '../../init/navigation/navigation_service.dart';

class FailedAlert extends AlertDialog {
  FailedAlert({
    Key? key,
    required BuildContext context,
    required String content,
    void Function()? onTap,
    Widget? child,
  }) : super(
          key: key,
          backgroundColor: context.blueChalk,
          shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
          title: _errorIcon(context),
          content: FlipInY(
            child: Text(
              content,
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            child ?? context.emptySizedHeightBoxExtraLow,
            _button(context, onTap),
          ],
        );

  static FlipInY _errorIcon(BuildContext context) => FlipInY(
        child: CircleAvatar(
          backgroundColor: context.red,
          child: Icon(
            Icons.error,
            color: context.blueChalk,
          ),
        ),
      );

  static FlipInY _button(BuildContext context, void Function()? onTap) =>
      FlipInY(
        child: SpecialButton(
          context: context,
          data: "Ok",
          onTap: onTap ?? () => NavigationService.pop(),
          backgroundColor: context.royalPurple,
        ),
      );
}
