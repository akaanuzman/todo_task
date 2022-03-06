import 'package:flutter/material.dart';

import '../../extensions/app_extensions.dart';

class SpecialButtonStyle extends ButtonStyle {
  SpecialButtonStyle({
    required BuildContext context,
    Color? clickColor,
  }) : super(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return clickColor ?? context.royalPurple.withOpacity(0.2);
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return context.royalPurple.withOpacity(0.2);
              }
              return context.primaryColor;
            },
          ),
        );
}
