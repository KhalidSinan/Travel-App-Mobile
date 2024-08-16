import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/home/data/models/group_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/models/organizer_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/models/single_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/repos/home_repo_impl.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_state.dart';

class MyTripsCubit extends Cubit<MyTripsState> {
  MyTripsCubit(this.homeRepoImpl) : super(MyTripsInitial());
  final HomeRepoImpl homeRepoImpl;

  List<SingleTripsModel> singleTrips = [];
  List<GroupTripsModel> groupTrips = [];
  List<OrganizerTripsModel> organizerTrips = [];

  List<SingleTripsModel> currentSingle = [];
  List<SingleTripsModel> latestSingle = [];

  List<GroupTripsModel> currentGroup = [];
  List<GroupTripsModel> latestGroup = [];

  List<OrganizerTripsModel> currentOrganizer = [];
  List<OrganizerTripsModel> latestOrganizer = [];
  bool switcher = false;

  Future<void> getMySingleTrips() async {
    var response = await homeRepoImpl.getMySingleTrips();
    response.fold(
      (failure) => emit(MyTripsFailure(failure: failure)),
      (response) {
        singleTrips = [];
        for (var i = 0; i < response['data'].length; i++) {
          singleTrips.add(SingleTripsModel.fromJson(response["data"][i]));
        }
        currentSingle = [];
        latestSingle = [];
        if (singleTrips.isNotEmpty) {
          for (var i = 0; i < singleTrips.length; i++) {
            if (singleTrips[i].completed) {
              latestSingle.add(singleTrips[i]);
            } else {
              currentSingle.add(singleTrips[i]);
            }
          }
        }
      },
    );
  }

  Future<void> getMyGroupTrips() async {
    emit(MyTripsLoading());
    var response = await homeRepoImpl.getMyGroupTrips();
    response.fold(
      (failure) {
        emit(MyTripsFailure(failure: failure));
      },
      (response) {
        groupTrips = [];
        for (var i = 0; i < response['data'].length; i++) {
          groupTrips.add(GroupTripsModel.fromJson(response["data"][i]));
        }
        currentGroup = [];
        latestGroup = [];
        if (groupTrips.isNotEmpty) {
          for (var i = 0; i < groupTrips.length; i++) {
            if (groupTrips[i].completed) {
              latestGroup.add(groupTrips[i]);
            } else {
              currentGroup.add(groupTrips[i]);
            }
          }
        }
      },
    );
    emit(MyTripsSuccess());
  }

  Future<void> getOrganizerTrips() async {
    emit(MyTripsLoading());
    var response = await homeRepoImpl.getOrganizerTrips();
    response.fold(
      (failure) => emit(MyTripsFailure(failure: failure)),
      (response) {
        organizerTrips = [];
        for (var i = 0; i < response['data'].length; i++) {
          organizerTrips.add(OrganizerTripsModel.fromJson(response["data"][i]));
        }
        currentOrganizer = [];
        latestOrganizer = [];
        if (organizerTrips.isNotEmpty) {
          for (var i = 0; i < organizerTrips.length; i++) {
            if (organizerTrips[i].completed) {
              latestOrganizer.add(organizerTrips[i]);
            } else {
              currentOrganizer.add(organizerTrips[i]);
            }
          }
        }
      },
    );
    emit(MyTripsSuccess());
  }

  void switchState() {
    emit(MyTripsSuccess());
  }
}
