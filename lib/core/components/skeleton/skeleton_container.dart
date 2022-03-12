import 'package:flutter/material.dart';
import '../../extensions/app_extensions.dart';

class SkeletonContainer extends AspectRatio {
  SkeletonContainer({
    Key? key,
    required BuildContext context,
  }) : super(
          aspectRatio: 7,
          key: key,
          child: Container(
            decoration: BoxDecoration(
              color: context.royalPurple,
              borderRadius: context.lowBorderRadius,
            ),
          ),
        );
}
