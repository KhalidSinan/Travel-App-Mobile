import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_button_with_icon.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/auth/data/repos/google-auth.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/horizontal_divider_with_text.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/register_form.dart';

class RegisterSheet extends StatelessWidget {
  const RegisterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: MediaQuery.sizeOf(context).height * .75,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CustomBackButton(),
                Text(
                  'Sign up',
                  style: Styles.heading.copyWith(fontSize: 40),
                ),
              ],
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
              suffix: Image.asset(
                Assets.google,
                width: 30,
                height: 30,
              ),
              onPressed: () async {
                await AuthGoogle().signInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
