import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/group_trip_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_states.dart';

class GroupTripDetailsCubit extends Cubit<GroupTripDetailsState> {
  GroupTripDetailsCubit(this.organizingGroupTripImpl, {required this.tripId})
      : super(GroupTripDetailsInitialState());

  final OrganizingGroupTripImpl organizingGroupTripImpl;
  GroupTripModel? groupTrip;
  final String tripId;

  void init() {
    print('aljf;lsaj');
  }

  Future<void> getGroupTripDetails() async {
    print('loading');
    emit(GroupTripDetailsLoadingState());
    var response =
        await organizingGroupTripImpl.getGroupTripDetails(tripId: tripId);
    response.fold(
      (failure) {
        emit(GroupTripDetailsFailureState(failure: failure));
      },
      (res) {
        groupTrip = GroupTripModel.fromJson(res['data']);
        emit(GroupTripDetailsSuccessState());
      },
    );
  }
}
