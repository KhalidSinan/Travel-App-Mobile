import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/check_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';

import '../../../data/models/cities_airline_model.dart';

class OrganizingTripCubit extends Cubit<OrganizingTripStates> {
  OrganizingTripCubit(this.organizingTripImpl) : super(InitialOrganizingTrip());

  final OrganizingTripImpl organizingTripImpl;

  List<CheckFlightModel>? checkFlights;

  List<dynamic> airlines = [];
  List<CountryModel> cities = [];
  List<PlaceModel> places = [];
  String? seatClass;

  //////////////////////////////
  String? source;
  String? classType;
  int? numberDays = 1;
  int? numberPerson = 1;
  String? startDate;

  Future<void> getCountriesAndAirlines() async {
    emit(LoadingOrganizingTrip());
    var response = await organizingTripImpl.getCitiesAndAirlines();
    response.fold(
      (failure) => emit(
        FailureOrganizingTrip(failure: failure),
      ),
      (response) {
        airlines = response['airlines'];
        for (var i = 0; i < response['cities'].length; i++) {
          cities.add(CountryModel.fromJson(response["cities"][i]));
          print(cities[i]);
        }
        emit(SuccessCheckAvailableFlight());
      },
    );
  }

  Future<void> getPlaces(
      {required String city, required String category}) async {
    emit(LoadingOrganizingTrip());
    var response =
        await organizingTripImpl.getPlaces(category: category, city: city);
    response.fold(
      (failure) {
        emit(FailureOrganizingTrip(failure: failure));
      },
      (response) {
        places = [];
        for (int i = 0; i < response['data'].length; i++) {
          places.add(PlaceModel.fromJson(response['data'][i]));
        }
        emit(PlacesSuccess());
      },
    );
  }

  void setNumberDays(int numDays) {
    numberDays = numDays;
  }

  void setNumberPerson(int numPerson) {
    numberPerson = numPerson;
  }

  void setStartDate(String startDate) {
    this.startDate = startDate;
  }

  void setSoucre(String source) {
    this.source = source;
  }

  void setClassType(String classType) {
    seatClass = getClass(selectedClass: classType);
  }

  String getClass({required String selectedClass}) {
    switch (selectedClass) {
      case 'First':
        return 'A';
      case 'Business':
        return 'B';
      case 'Economy':
        return 'C';
      default:
        return '';
    }
  }
}
