import 'package:travelapp_flutter/core/helpers/failure.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class AnnouncementsSuccess extends HomeState {}

class NearbySuccess extends HomeState {}

class TimerSuccess extends HomeState {}

class HomeFailure extends HomeState {
  final Failure failure;
  HomeFailure({required this.failure});
}
