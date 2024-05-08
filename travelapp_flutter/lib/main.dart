import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/notification_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:travelapp_flutter/features/auth/presentation/views/fetch_profile_data_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/all_flights_page.dart';
=======
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338
import 'package:travelapp_flutter/features/flight_booking/presentation/views/confirm_flight_reservation_page.dart';
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
          create: (context) => AllFlightsCubit(getIt.get<FlightBookingImp>())
            ..getAllOneWayFlights(
              source: 'United States',
              destination: 'Russia',
              date: '09/05/2024',
              seats: 1,
              seatsClass: 'A',
              // dateEnd: '10/05/2024',
            ),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme(),
        ),
        // home: rememberMe == true
        //     ? FetchProfileDataPage(token: token)
        //     : const LoginPage(),
<<<<<<< HEAD
        home: const AllFlightsPage(),
=======
        home: const FailurePage(),
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338
      ),
    );
  }
}
