import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
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
  Icon currentIcon = const Icon(
    FontAwesomeIcons.eyeSlash,
    size: 20,
    color: Colors.grey,
  );
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            validator: validateEmail,
            onSaved: (value) => email = value,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Password',
            obsecureText: obsecureText,
            suffixIcon: IconButton(
              onPressed: toggleObsecureText,
              icon: currentIcon,
            ),
            validator: validatePassword,
            onSaved: (value) => password = value,
          ),
          const LoginOptions(),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: 'Sign in',
              onPressed: login,
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void toggleObsecureText() {
    setState(() {
      obsecureText = !obsecureText;
    });
    currentIcon = obsecureText
        ? const Icon(
            FontAwesomeIcons.eyeSlash,
            color: Colors.grey,
          )
        : Icon(
            FontAwesomeIcons.eye,
            color: Themes.primary,
          );
  }
}
