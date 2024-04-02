import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/register_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_form.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: MediaQuery.sizeOf(context).height * .75,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Welcome again, sign in to book your trip',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            const LoginForm(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                CustomTextButton(
                  onPressed: () => Get.to(const RegisterPage()),
                  label: 'Sign up',
                  color: const Color(0xff2d2e49),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
