import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/extensions/app_extensions.dart';
import 'app_text_form_field.dart';

class BorderedTextFormField extends AppTextFormField {
  BorderedTextFormField(
      {Key? key,
      required BuildContext context,
      String? labelText,
      TextStyle? labelStyle,
      String? hintText,
      TextStyle? hintStyle,
      String? initialValue,
      String? Function(String?)? validator,
      Function(String?)? onSaved,
      Function(String)? onChanged,
      bool saveAttempted = false,
      TextInputAction textInputAction = TextInputAction.next,
      TextInputType? keyboardType,
      bool obscureText = false,
      EdgeInsetsGeometry? contentPadding,
      IconButton? suffixIcon,
      IconData? prefixIcon,
      Widget? prefix,
      Widget? suffix,
      String? errorText,
      List<TextInputFormatter>? inputFormatters,
      BorderRadius? borderRadius,
      TextEditingController? controller,
      bool? filled,
      Color? fillColor,
      bool? enabled})
      : super(
            key: key,
            enabled: enabled,
            context: context,
            controller: controller,
            labelText: labelText,
            labelStyle: labelStyle,
            hintText: hintText,
            hintStyle: hintStyle,
            obscureText: obscureText,
            contentPadding: contentPadding,
            validator: validator,
            prefix: prefix,
            suffix: suffix,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            keyboardType: keyboardType,
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? context.normalBorderRadius,
              borderSide: BorderSide(color: context.blueChalk),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? context.normalBorderRadius,
              borderSide: BorderSide(color: context.royalPurple),
            ),
            fillColor: fillColor,
            filled: filled);
}
