// ignore_for_file: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/notification_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/nav_bar_pages.dart';
import 'package:travelapp_flutter/core/widgets/splash_screen.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/cancel_organized_group_trip.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/fetch_profile_data_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/register_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/plane_page.dart';
import 'package:travelapp_flutter/features/home/data/repos/home_repo_impl.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/views/home_page.dart';
import 'package:travelapp_flutter/features/home/presentation/views/my_trips.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/hotel_search_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/5_hotel_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/share_trip.dart';

import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/delete_account_cubit/delete_account_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/notifi_cubit/notifi_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/report_and_rating_cubit/report_and_rating_cubit.dart';
import 'package:travelapp_flutter/firebase_options.dart';

// final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService().initialize();
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
          // BlocProvider(
          //     create: (context) =>
          //         OrganizingTripCubit(getIt.get<OrganizingTripImpl>())..getCountriesAndAirlines()),
          BlocProvider(
            create: (context) =>
                ProfilePageCubit(getIt.get<SettingsRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                OrganizedGroupCubit(getIt.get<OrganizingGroupTripImpl>())
                  ..getAllCountries()
                  ..getAllOrganizedTrips(),
          ),
          BlocProvider<DeleteAccountCubit>(
            create: (context) => DeleteAccountCubit(getIt.get<
                SettingsRepoImpl>()), // Ensure you inject the necessary dependencies
          ),
          BlocProvider(
            create: (context) => ReportAndRatingCubit(
              getIt.get<SettingsRepoImpl>(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeCubit(getIt.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => MyReservationsCubit(getIt.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => MyTripsCubit(getIt.get<HomeRepoImpl>()),
          ),
          BlocProvider(
              create: (context) =>
                  NotifiPageCubit(getIt.get<SettingsRepoImpl>())
                    ..getAllNotifications()),
          BlocProvider(
              create: (context) =>
                  ReportAndRatingCubit(getIt.get<SettingsRepoImpl>())),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: '/hotels', page: () => const HotelSelectionPage()),
            GetPage(name: '/LogIn', page: () => const LoginPage()),
            GetPage(name: '/flights', page: () => const PlanePage()),
            GetPage(name: '/hotelsSearch', page: () => const HotelSearchPage()),
          ],
          theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Themes.primary,
              selectionColor: Themes.primary,
              selectionHandleColor: Themes.primary,
            ),
            // home: ShareTripPage(id: "66bdc40ad575daa9a7b281b2"),
          ),
// home: NavBarPages(),
          home: rememberMe == true
              ? FetchProfileDataPage(token: token)
              : const SplashScreen(),
          // home: const OrganizedGroupTripDetailsPage(
          //   tripId: '66ba0eb360e2f6d63923d080',
          //   isOrganizer: true,
          // ),
          // home: const OrganizerReviewPage(
          //   tripId: '66bde5102c01e74d54006c7e',
          //   organizerName: 'Khalid Sinan',
          // )
          // emailVerify == true
          //     ? EmailConfirmationPage(
          //         email: emailToVerify!,
          //       )
          //     : const LoginPage(),
        ));
  }
}
