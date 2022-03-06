import 'package:flutter/material.dart';

import '../../extensions/app_extensions.dart';

class PurpleBoldText extends Text {
  PurpleBoldText({
    Key? key,
    required String data,
    required BuildContext context,
  }) : super(
          data,
          key: key,
          style: TextStyle(
            color: context.royalPurple,
            fontWeight: FontWeight.bold
          ),
        );
}
