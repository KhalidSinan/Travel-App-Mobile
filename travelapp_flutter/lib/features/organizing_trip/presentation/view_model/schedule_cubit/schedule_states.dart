import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ScheduleStates {}

class InitialScheduleState extends ScheduleStates {}

class GetPlacesSuccess extends ScheduleStates {}

class GetPlacesLoading extends ScheduleStates {}

class GetPlacesFailure extends ScheduleStates {
  final Failure failure;

  GetPlacesFailure({required this.failure});
}

class EditScheduleState extends ScheduleStates {}
