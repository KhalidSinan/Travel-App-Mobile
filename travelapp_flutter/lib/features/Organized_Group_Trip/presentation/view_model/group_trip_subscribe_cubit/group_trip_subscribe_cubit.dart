import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_subscribe_cubit/group_trip_subscribe_states.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';

class GroupTripSubscribeCubit extends Cubit<GroupTripSubscribeStates> {
  GroupTripSubscribeCubit(this.organizingGroupTripImpl)
      : super(InitialSubscribeState());

  final OrganizingGroupTripImpl organizingGroupTripImpl;

  Future<void> subscribe({
    required String tripId,
    required int numOfParticipants,
    required List<PassengerModel> participants,
  }) async {
    emit(LoadingSubscribeState());
    var response = await organizingGroupTripImpl.reserveGroupTrip(
      tripId: tripId,
      numOfParticipants: numOfParticipants,
      participants: participants,
    );

    response.fold(
      (failure) {
        emit(FailureSubscribeState(failure: failure));
      },
      (res) {
        emit(SuccessSubscribeState());
      },
    );
  }
}
