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
import 'package:travelapp_flutter/features/Announcements/presentation/views/announcements_subscriptions_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
<<<<<<< HEAD
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/info_organized_group_trip_page.dart';
=======
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/all_orgainzed_trip_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/organized_group_trip_details_page.dart';
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
<<<<<<< HEAD
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/GroupChat/button_chat.dart';
=======
import 'package:travelapp_flutter/features/auth/presentation/views/email_confirmation_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/register_page.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/create_chat_page.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/welcome_chat.dart';
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/1_persons_days_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/5_hotel_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/6_schedule_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/7_review_orgnizing_trip_page.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/delete_account_cubit/delete_account_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/report_and_rating_cubit/report_and_rating_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/becom_organizer_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/service_policy_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/settings_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/become_organizer_widgets/test.dart';
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
  bool? rememberMe, emailVerify;
  String? token, emailToVerify;
  @override
  void initState() {
    super.initState();
    final prefs = getIt.get<SharedPreferences>();
    emailVerify = prefs.getBool('email-verify');
    emailToVerify = prefs.getString('email-to-verify');
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
        ),
        BlocProvider(
<<<<<<< HEAD
          create: (context) =>
              OrganizedGroupCubit(getIt.get<OrganizingGroupTripImpl>())
                ..getAllCountries()
                ..getAllOrganizedTrips(),
        ),
        BlocProvider<DeleteAccountCubit>(
          create: (context) => DeleteAccountCubit(getIt.get<
              SettingsRepoImpl>()), // Ensure you inject the necessary dependencies
        ),
        BlocProvider(create: (context) => ReportAndRatingCubit(getIt.get<SettingsRepoImpl>()))
=======
            create: (context) =>
                OrganizedGroupCubit(getIt.get<OrganizingGroupTripImpl>())
            // ..getAllCountries()
            // ..getAllOrganizedTrips(),
            )
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/hotels', page: () => const HotelSelectionPage()),
        ],
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Themes.primary,
            selectionColor: Themes.primary,
            selectionHandleColor: Themes.primary,
          ),
<<<<<<< HEAD
          getPages: [
            GetPage(
                name: '/LogIn',
                page: () => const LoginPage()
                )
          ],
          // home: rememberMe == true
          //     ? FetchProfileDataPage(token: token)
          //     : const LoginPage(),
          home: ServicePolicyPage()),
=======
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.aBeeZeeTextTheme(),
        ),
        // home: rememberMe == true
        //     ? FetchProfileDataPage(token: token)
        //     : const LoginPage(),
        // home: const OrganizedGroupTripDetailsPage(
        //   tripId: '66ba0eb360e2f6d63923d080',
        //   isOrganizer: true,
        // ),
        home: emailVerify == true
            ? EmailConfirmationPage(
                email: emailToVerify!,
              )
            : const LoginPage(),
      ),
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
    );
  }
}
