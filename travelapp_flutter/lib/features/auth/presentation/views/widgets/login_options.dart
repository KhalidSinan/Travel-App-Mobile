import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_check_box.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/forgot_password_page.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({
    super.key,
  });

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomCheckBox(
            label: 'Remember me',
            value: BlocProvider.of<LoginCubit>(context).rememberMe,
            onChanged: (value) {
              setState(() {
                BlocProvider.of<LoginCubit>(context).rememberMe = value!;
              });
            },
           listTileControlAffinity: ListTileControlAffinity.leading, 
          ),
        ),
        CustomTextButton(
          onPressed: () => Get.to(() => const ForgotPasswordPage()),
          label: 'Forgot Password?',
        ),
      ],
    );
  }
}
