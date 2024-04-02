import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool obsecureText = true;
  bool obsecureTextConfirm = true;
  IconData currentIcon = FontAwesomeIcons.eyeSlash;
  IconData currentIconConfirm = FontAwesomeIcons.eyeSlash;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'First name',
                  textInputType: TextInputType.name,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Last name',
                  textInputType: TextInputType.name,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Confirm Password',
            obsecureText: obsecureTextConfirm,
            suffixIcon: IconButton(
              onPressed: toggleObsecureTextConfirm,
              icon: Icon(currentIconConfirm),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {},
              label: 'Sign up',
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

  void toggleObsecureTextConfirm() {
    setState(() {
      obsecureTextConfirm = !obsecureTextConfirm;
    });
    currentIconConfirm =
        obsecureTextConfirm ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye;
  }
}
