import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      ),
      home: const LoginPage(),
    );
  }
}
