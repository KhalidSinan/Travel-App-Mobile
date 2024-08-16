import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/register_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterPageBody(),
    );
  }
}
