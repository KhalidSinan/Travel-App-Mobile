// ignore_for_file: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/notification_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/all_orgainzed_trip_page.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/1_persons_days_selection_page.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/firebase_options.dart';

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print(message.data);
    print('some notification received');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  await setup();
  runApp(const TravelApp());
}

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  bool? rememberMe;
  String? token;
  @override
  void initState() {
    super.initState();
    final prefs = getIt.get<SharedPreferences>();
    rememberMe = prefs.getBool(rememberMeKey);
    token = prefs.getString(tokenKey);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
            create: (context) =>
                OrganizingTripCubit(getIt.get<OrganizingTripImpl>())
                  ..getCountriesAndAirlines()),
        BlocProvider(
          create: (context) => ProfilePageCubit(getIt.get<SettingsRepoImpl>()),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: Themes.primary,
              selectionColor: Themes.primary,
              selectionHandleColor: Themes.primary),
          appBarTheme: const AppBarTheme(
              color: Colors.white, surfaceTintColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.aBeeZeeTextTheme(),
        ),
        // home: rememberMe == true
        //     ? FetchProfileDataPage(token: token)
        //     : const LoginPage(),
        home: const AllOrganizedGroupTrips()
      ),
    );
  }
}
