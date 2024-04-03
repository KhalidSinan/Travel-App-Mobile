import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.obsecureText,
    this.textInputType,
    this.suffixIcon,
    this.onSaved,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool? obsecureText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      obscureText: obsecureText ?? false,
      keyboardType: textInputType,
      cursorColor: Themes.primary,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          // borderSide: const BorderSide(color: Colors.grey),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: suffixIcon,
        ),
      ),
    );
  }
}
