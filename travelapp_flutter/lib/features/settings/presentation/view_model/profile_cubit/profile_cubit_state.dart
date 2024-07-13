import 'package:travelapp_flutter/core/helpers/failure.dart';

class ProfileStates {}

class ProfileInitial extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileFailureState extends ProfileStates {
  final Failure failure;
  ProfileFailureState({required this.failure});
}
class CitiesSuccessState extends ProfileStates{}  

class ChangeSuccessState extends ProfileStates{}  

class EditingState extends ProfileStates{}  