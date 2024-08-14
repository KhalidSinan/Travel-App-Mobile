import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.onChanged,
    this.obsecureText,
    this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.prefixIcon,
    this.readOnly,
    this.onTap,
    this.controller,
    this.labeltext,
    this.outlineInputBorder,
<<<<<<< HEAD
    this.maxLines = 1,
=======
    this.contentPadding, this.minLines, this.maxLines,
>>>>>>> 2c44f886ba263ab71a8c6d9cf8f90252042a60ea
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool? obsecureText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? labeltext;
  final OutlineInputBorder? outlineInputBorder;
<<<<<<< HEAD
=======
  final EdgeInsetsGeometry? contentPadding;
  final int? minLines;
>>>>>>> 2c44f886ba263ab71a8c6d9cf8f90252042a60ea
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      obscureText: obsecureText ?? false,
      keyboardType: textInputType,
      cursorColor: Themes.primary,
<<<<<<< HEAD
      maxLines: maxLines,
=======
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
>>>>>>> 2c44f886ba263ab71a8c6d9cf8f90252042a60ea
      decoration: InputDecoration(
        contentPadding: contentPadding,
        labelText: labeltext,
        filled: true,
        fillColor: Colors.grey[100],
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          // borderSide: const BorderSide(color: Colors.grey),
          borderSide: BorderSide.none,
        ),
        enabledBorder: outlineInputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              // borderSide: const BorderSide(color: Colors.grey),
              borderSide: BorderSide.none,
            ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Themes.primary,
            width: 2,
          ),
          // borderSide: BorderSide.none,
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
