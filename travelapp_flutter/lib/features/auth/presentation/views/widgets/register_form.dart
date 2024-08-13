import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_states.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/email_confirmation_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/password_eye.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool obsecureText = true;
  bool obsecureTextConfirm = true;
  String? first, last, email, password, confirmPassword;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegistersStates>(
      listener: registerListener,
      builder: (context, state) => Form(
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
              suffixIcon: PasswordEye(onToggle: toggleObsecureText),
              validator: validatePassword,
              onSaved: (value) => password = value,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Confirm Password',
              obsecureText: obsecureTextConfirm,
              suffixIcon: PasswordEye(onToggle: toggleObsecureTextConfirm),
              validator: validatePassword,
              onSaved: (value) => confirmPassword = value,
            ),
            const SizedBox(height: 24),
            (state is LoadingRegisterState)
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: register,
                      label: 'Sign up',
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void registerListener(context, state) async {
    if (state is FailureRegisterState) {
      showCustomSnackBar(
        title: state.failure.errTitle ?? 'Error',
        message: state.failure.errMessage,
      );
    }
    if (state is SuccessRegisterState) {
      Get.to(() => EmailConfirmationPage(email: email!));
      final prefs = getIt.get<SharedPreferences>();
      await prefs.setBool('email-verify', true);
      await prefs.setString('email-to-verify', email!);
    }
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await BlocProvider.of<RegisterCubit>(context).register(
          firstName: first!,
          lastName: last!,
          email: email!,
          password: password!,
          confirmPassword: confirmPassword!);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void toggleObsecureText() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  void toggleObsecureTextConfirm() {
    setState(() {
      obsecureTextConfirm = !obsecureTextConfirm;
    });
  }
}
