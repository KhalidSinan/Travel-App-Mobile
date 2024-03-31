import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_button_with_icon.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/horizontal_divider_with_text.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/register_form.dart';

class RegisterSheet extends StatelessWidget {
  const RegisterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: MediaQuery.sizeOf(context).height * .80,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign up',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Create an account to book your trip',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            const RegisterForm(),
            const SizedBox(height: 16),
            const HorizontalDividerWithText(text: 'or'),
            const SizedBox(height: 16),
            CustomButtonWithIcon(
              label: 'Continue with Google',
              icon: FontAwesomeIcons.google,
              color: Colors.white70,
              onPressed: () {},
            ),
            // Row(
            //   children: [
            //     const Text("Have an account?"),
            //     CustomTextButton(
            //       onPressed: () => Get.to(const LoginPage()),
            //       label: 'Sign in',
            //       color: const Color(0xff2d2e49),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}