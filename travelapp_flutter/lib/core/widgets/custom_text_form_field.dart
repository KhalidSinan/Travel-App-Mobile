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
    this.labeltext, this.outlineInputBorder,
  });
  final String ?hintText;
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
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly ?? true,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
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
          // borderSide: const BorderSide(color: Colors.grey),
          borderSide: BorderSide.none,
        ),
        enabledBorder: outlineInputBorder?? OutlineInputBorder(
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
