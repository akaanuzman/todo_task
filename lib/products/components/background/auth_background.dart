import 'package:flutter/material.dart';
import '../../../core/extensions/app_extensions.dart';

class AuthBackground extends Container {
  AuthBackground({
    Key? key,
    required BuildContext context,
    required Widget child,
    String? topImage,
    String? bottomImage,
  }) : super(
          key: key,
          height: context.height,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  topImage ?? "assets/backgrounds/main_top.png",
                  width: context.dynamicWidth(0.4),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  bottomImage ?? "assets/backgrounds/main_bottom.png",
                  width: context.dynamicWidth(0.4),
                ),
              ),
              child,
            ],
          ),
        );
}
