import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfff2f4f3),
      body: SafeArea(
        child: LoginPageBody(),
      ),
    );
  }
}
