import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_participants_cubit/group_trip_participants_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/participant_card.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';

class GroupTripParticipantsCubit extends Cubit<GroupTripParticipantsStates> {
  GroupTripParticipantsCubit(this.organizingGroupTripImpl,
      {required this.tripId, required this.isOrganizer})
      : super(InitialParticipantsState());

  List<PassengerModel>? participants;
  final OrganizingGroupTripImpl organizingGroupTripImpl;
  final bool isOrganizer;
  final String tripId;

  Future<void> getTripParticipants() async {
    if (isOrganizer) {
      await getTripParticipantsOrganizer();
    } else {
      await getTripParticipantsUser();
    }
  }

  Future<void> getTripParticipantsOrganizer() async {
    emit(LoadingParticipantsState());
    var response = await organizingGroupTripImpl.getTripParticipantsOrganizer(
        tripId: tripId);
    response.fold(
      (failure) {
        emit(FailureParticipantsState(failure: failure));
      },
      (res) {
        if (res['data'].length == 0) {
          emit(NoParticipantsState());
          return;
        }
        List<PassengerModel> participants = [];
        for (var jsonParticipant in res['data']) {
          participants.add(PassengerModel.fromJson(jsonParticipant));
        }
        this.participants = participants;
        emit(SuccessParticipantsState());
      },
    );
  }

  Future<void> getTripParticipantsUser() async {
    emit(LoadingParticipantsState());
    var response =
        await organizingGroupTripImpl.getTripParticipantsUser(tripId: tripId);
    response.fold(
      (failure) {
        emit(FailureParticipantsState(failure: failure));
      },
      (res) {
        if (res['data'].length == 0) {
          emit(NoParticipantsState());
          return;
        }
        List<PassengerModel> participants = [];
        for (var jsonParticipant in res['data']) {
          participants.add(PassengerModel.fromJson(jsonParticipant));
        }
        this.participants = participants;
        emit(SuccessParticipantsState());
      },
    );
  }

  Future<void> cancelGroupTripReservation({
    required String participantId,
  }) async {
    emit(LoadingCancelReservationState());
    var response = await organizingGroupTripImpl.cancelGroupTripReservation(
      tripId: tripId,
      participantsId: [participantId],
    );
    response.fold(
      (failure) {
        emit(FailureCancelReservationState(failure: failure));
      },
      (res) {
        participants!
            .removeWhere((participant) => participant.id == participantId);
        emit(SuccessCancelReservationState());
      },
    );
  }
}
