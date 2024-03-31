import 'package:flutter/cupertino.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey();
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
                ),
              ),
              // SizedBox(width: 8),
              // Expanded(
              //   child: CustomTextFormField(
              //     hintText: 'Middle name',
              //   ),
              // ),
              SizedBox(width: 8),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Last name',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: 'Email',
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: 'Password',
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: 'Confirm Password',
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
}