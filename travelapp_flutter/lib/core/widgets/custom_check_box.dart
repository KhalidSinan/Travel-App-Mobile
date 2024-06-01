import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    this.label,
    required this.value,
    required this.onChanged,
    this.title,
    required this.listTileControlAffinity,
  });
  final String? label;
  final bool value;
  final void Function(bool?)? onChanged;
  final Widget? title;
  final ListTileControlAffinity listTileControlAffinity;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.value,
      onChanged: widget.onChanged,
      activeColor: Themes.primary,
      contentPadding: EdgeInsets.zero,
      controlAffinity: widget.listTileControlAffinity,
      title: widget.title ??
          const Text(
            'Remember me',
          ),
    );
  }
}

    // return Row(
    //   children: [
    //     Checkbox(
    //       splashRadius: 0,
    //       activeColor: Themes.primary,
    //       value: widget.value,
    //       onChanged: widget.onChanged,
    //     ),
    //     Text(
    //       widget.label,
    //       style: const TextStyle(
    //         fontSize: 16,
    //       ),
    //     ),
    //   ],
    // );