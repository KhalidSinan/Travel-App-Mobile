import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/notification_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< Updated upstream
<<<<<<< HEAD
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/hotel_search_page.dart';
=======
<<<<<<< Updated upstream
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
>>>>>>> Stashed changes
import 'package:travelapp_flutter/features/flight_booking/presentation/views/plane_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/all_hotel_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/hotel_details_page.dart';
=======
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/all_hotel_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/review_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/search_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/delete_page.dart';
>>>>>>> Hamzatii
>>>>>>> 6e92250e05ceb9fa7f83f6fa95e3bb44546f4a36
=======
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/search_hotel_page.dart';
>>>>>>> Stashed changes
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
      ],
      child: GetMaterialApp(
<<<<<<< Updated upstream
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.aBeeZeeTextTheme(),
        ),
        // home: rememberMe == true
        //     ? FetchProfileDataPage(token: token)
        //     : const LoginPage(),
<<<<<<< HEAD
        home: const HotelSearchPage(),
=======
<<<<<<< Updated upstream
<<<<<<< HEAD
<<<<<<< Updated upstream
        home: const AllHotelsPage(),
=======
        home: const HotelDetailsPage(),
>>>>>>> Stashed changes
=======
        home: ReviewPage()
        // const SearchPage()
        //AllHotelsPage(),
>>>>>>> Hamzatii
=======
        home: HotelDetailsPage(),
>>>>>>> Stashed changes
>>>>>>> 6e92250e05ceb9fa7f83f6fa95e3bb44546f4a36
      ),
=======
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.aBeeZeeTextTheme(),
          ),
          // home: rememberMe == true
          //     ? FetchProfileDataPage(token: token)
          //     : const LoginPage(),
          home: const SearchHotelPage()),
>>>>>>> Stashed changes
    );
  }
}
