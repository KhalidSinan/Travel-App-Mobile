import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
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
      listener: forgotPasswordListener,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  const CustomBackButton(),
                  Text(
                    'Forgot Password',
                    style: Styles.heading,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 48),
                child: Text(
                  'Enter the email address associated with your account and we\'ll send you a code to reset your password',
                  style: Styles.subtitle,
                ),
              ),
              const SizedBox(height: 20),
              Stepper(
                type: StepperType.vertical,
                currentStep: currentStep,
                onStepContinue: onStepContinue,
                onStepCancel: onStepCancel,
                connectorColor: getConnectorColor(),
                connectorThickness: 2,
                physics: const NeverScrollableScrollPhysics(),
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
                steps: getSteps,
              ),
              // const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }

  MaterialStateColor getConnectorColor() {
    return MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Themes.primary;
      }
      return Colors.grey;
    });
  }

  List<Step> get getSteps {
    return [
      emailStep(),
      codeStep(),
      passwordStep(),
    ];
  }

  void forgotPasswordListener(context, state) {
    if (state is FailureStepState) {
      showCustomSnackBar(title: 'Error', message: state.failure.errMessage);
    }
    if (state is SuccessStepState) {
      setState(() => currentStep++);
    }
    if (state is FinalStepState) {
      showCustomSnackBar(title: 'Success', message: state.message);
      Get.to(() => const LoginPage());
    }
  }

  Step passwordStep() {
    return Step(
      title: const Text('Reset Password'),
      isActive: currentStep >= 2,
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Form(
          key: passwordKey,
          autovalidateMode: autovalidateMode,
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
    );
  }

  Step codeStep() {
    return Step(
      title: const Text('Verify Code'),
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Form(
          key: codeKey,
          autovalidateMode: autovalidateMode,
          child: CustomTextFormField(
            hintText: 'Code',
            validator: validateCode,
            textInputType: TextInputType.number,
            onSaved: (value) => code = value,
          ),
        ),
      ),
    );
  }

  Step emailStep() {
    return Step(
      title: const Text('Email'),
      isActive: currentStep >= 0,
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
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
    );
  }

  void onStepCancel() {
    setState(() => currentStep--);
  }

  void onStepContinue() async {
    if (currentStep == 0) {
      await sendCodeToEmail();
    } else if (currentStep == 1) {
      codeValidate();
    } else {
      await resetPassword();
    }
  }

  Future<void> resetPassword() async {
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

  void codeValidate() {
    if (codeKey.currentState!.validate()) {
      codeKey.currentState!.save();
      print(code);
      setState(() => currentStep++);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  Future<void> sendCodeToEmail() async {
    if (emailKey.currentState!.validate()) {
      emailKey.currentState!.save();
      await BlocProvider.of<ForgotPasswordCubit>(context)
          .forgotPassword(email: email!);
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
