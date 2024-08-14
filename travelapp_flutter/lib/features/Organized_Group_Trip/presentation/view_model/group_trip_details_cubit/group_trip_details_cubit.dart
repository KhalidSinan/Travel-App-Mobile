import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/group_trip_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_states.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_states.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';

class GroupTripDetailsCubit extends Cubit<GroupTripDetailsState> {
  GroupTripDetailsCubit(
    this.organizingGroupTripImpl, {
    required this.tripId,
    this.subscribed = false,
    this.isOrganizer = false,
    this.joinedChat = false,
  }) : super(GroupTripDetailsInitialState());

  final OrganizingGroupTripImpl organizingGroupTripImpl;
  final String tripId;
  bool subscribed;
  bool isOrganizer;
  bool joinedChat;
  GroupTripModel? groupTrip;
  String currentDestination = '';
  bool isBack = false;

  Future<void> getGroupTripDetails() async {
    emit(GroupTripDetailsLoadingState());
    var response =
        await organizingGroupTripImpl.getGroupTripDetails(tripId: tripId);
    response.fold(
      (failure) {
        emit(GroupTripDetailsFailureState(failure: failure));
      },
      (res) {
        groupTrip = GroupTripModel.fromJson(res['data']);
        currentDestination = groupTrip!.destinations[0].destination.city;
        emit(GroupTripDetailsSuccessState());
      },
    );
  }

  Future<void> deleteGroupTrip() async {
    emit(GroupTripDetailsLoadingState());
    var response =
        await organizingGroupTripImpl.cancelGroupTrip(tripId: tripId);
    response.fold(
      (failure) {
        emit(GroupTripDetailsFailureState(failure: failure));
      },
      (res) {
        emit(DeleteGroupTripSuccessState());
      },
    );
  }

  void setCurrentDestination(String destination) {
    currentDestination = destination;
    emit(GroupTripChangeDestinationState());
  }

  void showIsBack(int index) {
    isBack = index >= 1;
    emit(GroupTripChangeDestinationState());
  }

  bool showFooter() {
    return currentDestination != 'Form';
  }
}
