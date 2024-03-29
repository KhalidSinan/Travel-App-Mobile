import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const SafeArea(
        child: LoginPageBody(),
      ),
    );
  }
}
