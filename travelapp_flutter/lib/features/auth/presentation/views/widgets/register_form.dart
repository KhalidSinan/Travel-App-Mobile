import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
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
  String? first, last, email, password, confirmPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'First name',
                  textInputType: TextInputType.name,
                  validator: validateName,
                  onSaved: (value) => first = value,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Last name',
                  textInputType: TextInputType.name,
                  validator: validateName,
                  onSaved: (value) => last = value,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
              icon: Icon(currentIcon),
            ),
            validator: validatePassword,
            onSaved: (value) => password = value,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Confirm Password',
            obsecureText: obsecureTextConfirm,
            suffixIcon: IconButton(
              onPressed: toggleObsecureTextConfirm,
              icon: Icon(currentIconConfirm),
            ),
            validator: validatePassword,
            onSaved: (value) => confirmPassword = value,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: register,
              label: 'Sign up',
            ),
          ),
        ],
      ),
    );
  }

  void register() async {
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
