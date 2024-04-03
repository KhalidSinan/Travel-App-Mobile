import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

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
    return CheckboxListTile(
      value: checked,
      onChanged: (value) {
        setState(() {
          checked = value;
        });
      },
      activeColor: Themes.primary,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      title: const Text(
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