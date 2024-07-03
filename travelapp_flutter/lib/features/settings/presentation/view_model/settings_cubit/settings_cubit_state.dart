import 'package:travelapp_flutter/core/helpers/failure.dart';

class SettingsStates {}

class SettingsInitial extends SettingsStates {}

class SettingsFailureState extends SettingsStates {
   final Failure failure;
  SettingsFailureState({required this.failure});
}