import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme(),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
