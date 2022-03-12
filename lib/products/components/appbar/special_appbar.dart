import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../core/components/text/headline6_text.dart';

class SpecialAppBar extends AppBar {
  SpecialAppBar({
    Key? key,
    required BuildContext context,
    required String title,
    bool? centerTitle,
    bool? automaticallyImplyLeading,
    Color? iconThemeColor,
    List<Widget>? actions,
  }) : super(
          key: key,
          centerTitle: centerTitle,
          automaticallyImplyLeading: automaticallyImplyLeading ?? true,
          title: FadeInDownBig(
            child: Headline6Text(context: context, data: title),
          ),
          iconTheme: IconThemeData(color: iconThemeColor),
          actions: actions
        );
}
