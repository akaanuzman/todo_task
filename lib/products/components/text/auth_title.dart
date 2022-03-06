import 'package:flutter/material.dart';

import '../../../core/components/text/headline6_text.dart';
import '../../../core/extensions/app_extensions.dart';

class AuthTitle extends Padding {
  AuthTitle({
    Key? key,
    required BuildContext context,
    required String title,
  }) : super(
          padding: context.paddingNormal,
          key: key,
          child: Center(
            child: Headline6Text(
              data: title,
              context: context,
            ),
          ),
        );
}
