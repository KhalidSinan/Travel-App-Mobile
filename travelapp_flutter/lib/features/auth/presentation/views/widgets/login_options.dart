import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/custom_check_box.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCheckBox(
          label: 'Remember me',
          value: false,
          onChanged: (value) {},
        ),
        CustomTextButton(
          onPressed: () {},
          label: 'Forgot Password?',
        ),
      ],
    );
  }
}
