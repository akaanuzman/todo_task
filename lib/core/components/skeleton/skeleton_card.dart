import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'skeleton_animation.dart';
import '../../extensions/app_extensions.dart';

class SkeletonCard extends Shimmer {
  SkeletonCard({
    Key? key,
    required BuildContext context,
  }) : super(
          child: _card(context),
        );

  static Card _card(BuildContext context) => Card(
        shape: RoundedRectangleBorder(borderRadius: context.highBorderRadius),
        elevation: 3,
        color: context.blueChalk,
        child: ListTile(
          leading: _leading(context),
          title: _title(context),
          subtitle: _subtitle(context),
        ),
      );

  static Shimmer _leading(BuildContext context) => Shimmer(
        child: CircleAvatar(
          backgroundColor: context.secondaryTextColor.withOpacity(0.5),
        ),
      );

  static SkeletonAnimation _title(BuildContext context) => SkeletonAnimation(
        context: context,
        padding: context.verticalPaddingLow,
      );

  static SkeletonAnimation _subtitle(BuildContext context) => SkeletonAnimation(
        context: context,
        padding: EdgeInsets.only(bottom: context.lowValue),
      );
}
