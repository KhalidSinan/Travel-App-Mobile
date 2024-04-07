import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
<<<<<<< HEAD
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/email_confirmation_page.dart';
import 'package:google_fonts/google_fonts.dart';
=======
import 'package:travelapp_flutter/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
>>>>>>> e96e5cea87b21f6b75df79335107c8bc2bb9d17a

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        home: const EmailConfirmationPage(),
      ),
    );
  }
}
