import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
