import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_steps_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_steps_states.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/password_eye.dart';

import '../../../../../core/utils/styles.dart';

class ForgotPasswordPageBody extends StatefulWidget {
  const ForgotPasswordPageBody({super.key});

  @override
  State<ForgotPasswordPageBody> createState() => _ForgotPasswordPageBodyState();
}

class _ForgotPasswordPageBodyState extends State<ForgotPasswordPageBody> {
  int currentStep = 0;
  String? email, code, newPassword, newPasswordConfirm;
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> codeKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool obsecureText = true;
  bool obsecureTextConfirm = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordStepsState>(
      listener: (context, state) {
        if (state is FailureStepState) {
          showCustomSnackBar(title: 'Error', message: state.errMessage);
        }
        if (state is SuccessStepState) {
          setState(() => currentStep++);
        }
        if (state is FinalStepState) {
          showCustomSnackBar(title: 'Success', message: state.message);
          Get.to(() => const LoginPage());
        }
      },
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const Spacer(flex: 1),
            Text(
              'Forgot Password',
              style: Styles.heading,
            ),
            // subtitle
            Text(
              'Complete the steps to reset your password',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Stepper(
              currentStep: currentStep,
              onStepContinue: onStepContinue,
              onStepCancel: onStepCancel,
              steps: [
                Step(
                  title: const Text('Email'),
                  isActive: currentStep >= 0,
                  state:
                      currentStep > 0 ? StepState.complete : StepState.indexed,
                  content: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Form(
                      key: emailKey,
                      autovalidateMode: autovalidateMode,
                      child: CustomTextFormField(
                        hintText: 'Email',
                        validator: validateEmail,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => email = value,
                      ),
                    ),
                  ),
                ),
                Step(
                  title: const Text('Verify Code'),
                  content: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Form(
                      key: codeKey,
                      child: CustomTextFormField(
                        hintText: 'Code',
                        validator: validateName,
                        textInputType: TextInputType.number,
                        onSaved: (value) => code = value,
                      ),
                    ),
                  ),
                  isActive: currentStep >= 1,
                  state:
                      currentStep > 1 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: const Text('Reset Password'),
                  content: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Form(
                      key: passwordKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hintText: 'New Password',
                            validator: validatePassword,
                            obsecureText: obsecureText,
                            suffixIcon: PasswordEye(
                              onToggle: toggleObsecureText,
                            ),
                            onSaved: (value) => newPassword = value,
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField(
                            hintText: 'New Password Confirm',
                            validator: validatePassword,
                            obsecureText: obsecureTextConfirm,
                            suffixIcon: PasswordEye(
                              onToggle: toggleObsecureTextConfirm,
                            ),
                            onSaved: (value) => newPasswordConfirm = value,
                          ),
                        ],
                      ),
                    ),
                  ),
                  isActive: currentStep >= 2,
                  state:
                      currentStep > 2 ? StepState.complete : StepState.indexed,
                ),
              ],
              type: StepperType.vertical,
              connectorThickness: 2,
              controlsBuilder: (context, details) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (state is LoadingStepState)
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: CustomButton(
                              onPressed: details.onStepContinue,
                              label: details.currentStep == 2
                                  ? 'Reset'
                                  : 'Continue',
                            ),
                          ),
                    const SizedBox(width: 16),
                    details.currentStep >= 1
                        ? Expanded(
                            child: CustomButton(
                              onPressed: details.onStepCancel,
                              label: 'Back',
                            ),
                          )
                        : const SizedBox(),
                  ],
                );
              },
              connectorColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Themes.primary;
                }
                return Colors.grey;
              }),
            ),
          ],
        ),
      ),
    );
  }

  void onStepCancel() {
    setState(() => currentStep--);
  }

  void onStepContinue() async {
    if (currentStep == 0) {
      if (emailKey.currentState!.validate()) {
        emailKey.currentState!.save();
        await BlocProvider.of<ForgotPasswordCubit>(context)
            .forgotPassword(email: email!);
      } else {
        autovalidateMode = AutovalidateMode.always;
        setState(() {});
      }
    } else if (currentStep == 1) {
      if (codeKey.currentState!.validate()) {
        codeKey.currentState!.save();
        print(code);
        setState(() => currentStep++);
      } else {
        autovalidateMode = AutovalidateMode.always;
        setState(() {});
      }
    } else {
      if (passwordKey.currentState!.validate()) {
        passwordKey.currentState!.save();
        await BlocProvider.of<ForgotPasswordCubit>(context).resetPassword(
          newPassword: newPassword!,
          newPasswordConfirm: newPasswordConfirm!,
          code: code!,
          email: email!,
        );
      } else {
        autovalidateMode = AutovalidateMode.always;
        setState(() {});
      }
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
