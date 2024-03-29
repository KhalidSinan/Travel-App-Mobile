import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/image_slider.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_form.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // image slider
        ImageSlider(),
        // login form
        Expanded(
          child: LoginForm(),
        ),
      ],
    );
  }
}
