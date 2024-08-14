import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomTextFilledOrganizer extends StatelessWidget {
  const CustomTextFilledOrganizer({
    super.key,
    this.hintText,
    this.onChanged,
    this.obsecureText,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    this.onTap,
    this.controller,
    this.labeltext,
    this.outlineInputBorder,
  });
  final String? hintText;
  final void Function(String)? onChanged;
  final bool? obsecureText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? labeltext;
  final OutlineInputBorder? outlineInputBorder;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
     
      obscureText: obsecureText ?? false,
      keyboardType: textInputType,
      cursorColor: Themes.primary,
      decoration: InputDecoration(
        labelText: labeltext,
        filled: true,
        fillColor: Colors.grey[100],
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: outlineInputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide.none,
            ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Themes.primary,
            width: 2,
          ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: prefixIcon,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: suffixIcon,
        ),
      ),
    );
  }
}
