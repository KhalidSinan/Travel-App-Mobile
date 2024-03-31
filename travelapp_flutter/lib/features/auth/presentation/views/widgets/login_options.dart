import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/custom_check_box.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({
    super.key,
  });

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCheckBox(
          label: 'Remember me',
          value: checked,
          onChanged: (value) {
            setState(() {
              checked = value!;
            });
          },
        ),
        CustomTextButton(
          onPressed: () {},
          label: 'Forgot Password?',
        ),
      ],
    );
  }
}
