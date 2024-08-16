import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_states.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/fetch_profile_data_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_options.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/password_eye.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obsecureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: loginListener,
      builder: (context, state) => Form(
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
              suffixIcon: PasswordEye(onToggle: toggleObsecureText),
              validator: validatePassword,
              onSaved: (value) => password = value,
            ),
            const LoginOptions(),
            const SizedBox(height: 24),
            (state is LoadingLoginState)
                ? const CustomLoading()
                : SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      label: 'Sign in',
                      onPressed: login,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void loginListener(context, state) async {
    if (state is FailureLoginState) {
      showCustomSnackBar(title: 'Error', message: state.failure.errMessage);
    }
    if (state is SuccessLoginState) {
      Get.off(() => const FetchProfileDataPage());
    }
  }

  void toggleObsecureText() {
    setState(() {
      obsecureText = !obsecureText;
    });
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await BlocProvider.of<LoginCubit>(context).login(
        email: email!,
        password: password!,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
