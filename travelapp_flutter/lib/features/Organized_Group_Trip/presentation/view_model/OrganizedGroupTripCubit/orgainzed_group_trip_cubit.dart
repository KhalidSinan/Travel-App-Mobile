import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';

class OrganizedGroupCubit extends Cubit<OrganizedGroupCubitState> {
  OrganizedGroupCubit(this.organizingGroupTripImpl)
      : super(OrganizedGroupTripInitialState());
  final OrganizingGroupTripImpl organizingGroupTripImpl;
  late List<AllOrganizedGroupTrip> allOrganizedGroupTrip =[];
  late List<String> allCountries = [];

  String? source;
  int page= 1;

  Future<void> getAllCountries() async {
    emit(LoadingOrganizedGroupTripState());
    dynamic response = await organizingGroupTripImpl.getAllCountries();
    response.fold(
        (failure) => emit(FailureOrganizedGroupTripState(failure: failure)),
        (response) {
      allCountries = List<String>.from(response['data']);
      // print(allCountries);
      emit(SuccessOrganizedGroupTripState());
    });
  }

  Future<void> getAllOrganizedTrips({String? tab, int? page}) async {
    emit(LoadingOrganizedGroupTripState());
    dynamic response = await organizingGroupTripImpl.getAllOrganizedTrips(
        page: 1, source: source ?? "");

    response
        .fold((failue) => emit(FailureOrganizedGroupTripState(failure: failue)),
            (response) {
      for (var i = 0; i < response["data"].length; i++) {
        allOrganizedGroupTrip
            .add(AllOrganizedGroupTrip.fromJson(response['data'][i]));
            print(response['data']);
            print(allOrganizedGroupTrip[i]);
      }
      emit(SuccessOrganizedGroupTripState());
    });
  }

  Future<void>changPage(int page)async{
    this.page = page;
    await getAllOrganizedTrips(page: page);

  }
}
