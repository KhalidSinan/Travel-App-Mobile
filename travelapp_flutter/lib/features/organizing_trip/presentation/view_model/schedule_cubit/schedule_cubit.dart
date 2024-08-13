import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';

class ScheduleCubit extends Cubit<ScheduleStates> {
  ScheduleCubit({
    required this.destinations,
    this.isEditable = true,
    this.isShowDetails = false,
    required this.organizingTripImpl,
  }) : super(InitialScheduleState());

  OrganizingTripImpl organizingTripImpl;
  List<DestinationsModel> destinations;
  List<PlaceModel> places = [];
  Map<String, List<Map<String, List<PlaceModel?>>>> tripSchedule = {};
  List<int> currentSteps = [];
  bool isEditable;
  bool isShowDetails;

  Future<void> getTripSchedule({required String? tripId}) async {
    if (tripId == null || !isShowDetails) return;
    emit(GetPlacesLoading());
    var response = await organizingTripImpl.getTripSchedule(tripId: tripId);
    response.fold(
      (failure) {
        emit(GetPlacesFailure(failure: failure));
      },
      (res) {
        for (var destination in res['data']) {
          Map<String, dynamic> activities = destination['activities'];
          List<Map<String, List<PlaceModel?>>> daysList = List.generate(
            destination['num_of_days'],
            (index) {
              return {"day${index + 1}": []};
            },
          );
          activities.forEach((day, listOfActivities) {
            List<PlaceModel?> places = [];
            for (var jsonPlace in listOfActivities) {
              places.add(PlaceModel.fromJson(jsonPlace));
            }
            daysList[int.parse(day) - 1] = {'day$day': places};
          });
          tripSchedule[destination['city']] = daysList;
        }
        emit(GetPlacesSuccess());
      },
    );
  }

  void createCurrentSteps() {
    currentSteps = List.filled(destinations.length, 0);
  }

  void createTripSchedule() {
    for (var city in destinations) {
      List<Map<String, List<PlaceModel?>>> daysList = [];
      for (var i = 1; i <= city.days; i++) {
        daysList.add({'day$i': []});
      }
      tripSchedule[city.city] = daysList;
    }
  }

  void updateTripSchedule(String city, int step, PlaceModel place) {
    tripSchedule[city]![step]['day${step + 1}']!.add(place);
    emit(EditScheduleState());
  }

  void deleteFromTripSchedule(String city, int step, int i) {
    tripSchedule[city]![step]['day${step + 1}']!.removeAt(i);
    emit(EditScheduleState());
  }

  Future<void> getPlaces(
      {required String city, required String category}) async {
    emit(GetPlacesLoading());
    var response =
        await organizingTripImpl.getPlaces(category: category, city: city);
    response.fold(
      (failure) {
        emit(GetPlacesFailure(failure: failure));
      },
      (response) {
        places = [];
        for (int i = 0; i < response['data'].length; i++) {
          places.add(PlaceModel.fromJson(response['data'][i]));
        }
        emit(GetPlacesSuccess());
      },
    );
  }
}
