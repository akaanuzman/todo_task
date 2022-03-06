import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class SpecialButton extends ElevatedButton {
  SpecialButton({
    Key? key,
    void Function()? onTap,
    required BuildContext context,
    String? data,
    Widget? child,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          onPressed: onTap ?? () {},
          child: Padding(
            padding: context.verticalPaddingNormal,
            child: child ?? Text(data ?? ""),
          ),
          style: _style(context, borderRadius ?? context.normalBorderRadius),
          key: key,
        );

  static ButtonStyle _style(
          BuildContext context, BorderRadiusGeometry borderRadius) =>
      ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return context.blueChalk.withOpacity(0.2);
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return context.blueChalk.withOpacity(0.2);
            }
            return context.primaryColor;
          },
        ),
        backgroundColor: MaterialStateProperty.all<Color>(context.royalPurple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      );
}