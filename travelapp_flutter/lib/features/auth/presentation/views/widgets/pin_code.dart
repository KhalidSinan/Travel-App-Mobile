import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
    this.autoFocus,
    this.onChanged,
  });
  final bool? autoFocus;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 68,
      child: TextFormField(
        keyboardType: TextInputType.number,
        autofocus: autoFocus ?? true,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        cursorColor: Themes.primary,
        style: TextStyle(
          color: Themes.primary,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Themes.secondary,
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Themes.primary, width: 3),
          ),
        ),
      ),
    );
  }
}
