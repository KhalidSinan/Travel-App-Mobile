import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/password_eye.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/change_password_cubit/change_password_cubit_state.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  int currentStep = 0;
  String? oldPassword, newPassword, confirmationNewPassword;
  GlobalKey<FormState> oldPasswordKey = GlobalKey();
  GlobalKey<FormState> newPasswordKey = GlobalKey();
  GlobalKey<FormState> confirmationNewPasswordKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool obsecureOldPassword = true;
  bool obsecureNewPassword = true;
  bool obsecureConfirmationNewPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordStates>(
      listener: changePasswordListener,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      'Change Password',
                      style: Styles.heading,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Enter your old password then enter a new password to change your password',
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
                  return (state is LoadingChangePassword)
                      ? const CircularProgressIndicator()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: details.onStepContinue,
                                label: details.currentStep == 2
                                    ? 'Change'
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
      oldPasswordStep(),
      newPasswordStep(),
      confirmNewPasswordStep(),
    ];
  }

  void changePasswordListener(context, state) {
    if (state is FailureChangePassword) {
      showCustomSnackBar(title: 'Error', message: state.failure.errMessage);
    } else if (state is SuccessChangePassword) {
      Get.back();
      showCustomSnackBar(title: 'Success', message: state.successMessage);
    }
  }

  Step confirmNewPasswordStep() {
    return Step(
      title: const Text('Confirm New Password'),
      isActive: currentStep >= 2,
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Form(
          key: confirmationNewPasswordKey,
          autovalidateMode: autovalidateMode,
          child: CustomTextFormField(
            hintText: 'confirm new password',
            validator: validatePassword,
            obsecureText: obsecureConfirmationNewPassword,
            suffixIcon: PasswordEye(
              onToggle: toggleObsecureConfirmNewPassword,
            ),
            onSaved: (value) => confirmationNewPassword = value,
          ),
        ),
      ),
    );
  }

  Step newPasswordStep() {
    return Step(
      title: const Text('New Password'),
      isActive: currentStep >= 1,
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Form(
          key: newPasswordKey,
          autovalidateMode: autovalidateMode,
          child: CustomTextFormField(
            hintText: 'new password',
            validator: validatePassword,
            obsecureText: obsecureNewPassword,
            suffixIcon: PasswordEye(
              onToggle: toggleObsecureNewPassword,
            ),
            onSaved: (value) => newPassword = value,
          ),
        ),
      ),
    );
  }

  Step oldPasswordStep() {
    return Step(
      title: const Text('Old Password'),
      isActive: currentStep >= 0,
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Form(
          key: oldPasswordKey,
          autovalidateMode: autovalidateMode,
          child: CustomTextFormField(
            hintText: 'your old password',
            validator: validatePassword,
            obsecureText: obsecureOldPassword,
            suffixIcon: PasswordEye(
              onToggle: toggleObsecureOldPassword,
            ),
            onSaved: (value) => oldPassword = value,
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
      enterOLdPassword();
    } else if (currentStep == 1) {
      enterNewPassword();
    } else {
      await changePassword();
    }
  }

  Future<void> changePassword() async {
    if (confirmationNewPasswordKey.currentState!.validate()) {
      confirmationNewPasswordKey.currentState!.save();
      await BlocProvider.of<ChangePasswordCubit>(context).changePassword(
          oldPassword: oldPassword!,
          newPassword: newPassword!,
          confirmationNewPassword: confirmationNewPassword!);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void enterNewPassword() {
    if (newPasswordKey.currentState!.validate()) {
      newPasswordKey.currentState!.save();
      setState(() => currentStep++);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void enterOLdPassword() {
    if (oldPasswordKey.currentState!.validate()) {
      oldPasswordKey.currentState!.save();
      setState(() => currentStep++);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void toggleObsecureOldPassword() {
    setState(() {
      obsecureOldPassword = !obsecureOldPassword;
    });
  }

  void toggleObsecureNewPassword() {
    setState(() {
      obsecureNewPassword = !obsecureNewPassword;
    });
  }

  void toggleObsecureConfirmNewPassword() {
    setState(() {
      obsecureConfirmationNewPassword = !obsecureConfirmationNewPassword;
    });
  }
}
