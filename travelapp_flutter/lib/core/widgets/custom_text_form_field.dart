import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.obsecureText,
    this.textInputType,
    this.suffixIcon,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? obsecureText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obsecureText ?? false,
      keyboardType: textInputType,
      cursorColor: Colors.black45,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey),
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
