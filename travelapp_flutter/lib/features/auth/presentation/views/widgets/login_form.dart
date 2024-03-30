import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_options.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obsecureText = true;
  IconData currentIcon = FontAwesomeIcons.eyeSlash;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const CustomTextFormField(
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Password',
            obsecureText: obsecureText,
            suffixIcon: IconButton(
              onPressed: toggleObsecureText,
              icon: Icon(currentIcon),
            ),
          ),
          const LoginOptions(),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: 'Sign in',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void toggleObsecureText() {
    setState(() {
      obsecureText = !obsecureText;
    });
    currentIcon =
        obsecureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye;
  }
}
