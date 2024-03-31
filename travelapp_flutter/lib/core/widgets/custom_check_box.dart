import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final bool value;
  final void Function(bool?)? onChanged;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          splashRadius: 0,
          activeColor: const Color(0xff2d2e49),
          value: widget.value,
          onChanged: widget.onChanged,
        ),
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
