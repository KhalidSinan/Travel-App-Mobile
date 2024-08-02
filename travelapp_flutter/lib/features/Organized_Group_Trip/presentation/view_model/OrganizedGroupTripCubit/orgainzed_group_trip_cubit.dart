import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';

class OrganizedGroupCubit extends Cubit<OrganizedGroupCubitState> {
  OrganizedGroupCubit(this.organizingGroupTripImpl)
      : super(OrganizedGroupTripInitialState());
  final OrganizingGroupTripImpl organizingGroupTripImpl;
  late List<AllOrganizedGroupTrip> allOrganizedGroupTrip;

  Future<void> getAllOrganizedTrips() async {
    emit(LoadingOrganizedGroupTripState());
    dynamic response =
        await organizingGroupTripImpl.getAllOrganizedTrips(page: 1);

    response
        .fold((failue) => emit(FailureOrganizedGroupTripState(failure: failue)),
            (response) {
      for (var i = 0; i < response["data"].length; i++) {
        allOrganizedGroupTrip
            .add(AllOrganizedGroupTrip.fromJson(response['data'][i]));
      }
      emit(SuccessOrganizedGroupTripState());
    });
  }
}
