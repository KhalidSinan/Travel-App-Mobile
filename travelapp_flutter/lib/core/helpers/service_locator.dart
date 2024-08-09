import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo_impl.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<FlightBookingImp>(FlightBookingImp(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<ChatImplRepo>(ChatImplRepo(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<HotelBookingImp>(HotelBookingImp(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<OrganizingTripImpl>(OrganizingTripImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<OrganizingGroupTripImpl>(OrganizingGroupTripImpl(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<SettingsRepoImpl>(SettingsRepoImpl(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<DefaultStatusCodeHandler>(DefaultStatusCodeHandler());
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
}
