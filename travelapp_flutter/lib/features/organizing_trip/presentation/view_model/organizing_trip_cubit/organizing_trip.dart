

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/available_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/check_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/filtering_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/trip_Info_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';

import '../../../data/models/cities_airline_model.dart';
import '../../../data/repos/organizing_trip_repo_impl.dart';

class OrganizingTripCubit extends Cubit<OrganizingTripStates> {
  OrganizingTripCubit(this.organizingTripImpl) : super(InitialOrganizingTrip());

  final OrganizingTripImpl organizingTripImpl;

  List<CheckFlightModel>? checkFlights;

  List<dynamic> airlines = [];
  List<CountryModel> cities = [];
  List<PlaceModel> places = [];
  String? seatClass;
  List<AvailableFlightModel> availableFlightModel = [];
  late TripOrgModel tripGeneralInfo;
  //////////////////////////////
  String? source;
  String? classType;
  int? numberDays;
  int? numberPerson;
  String? startDate;
  bool returnHome = false;
  RangeValues? prices = const RangeValues(0, 1500);
  String? airlinefilter;
  String? timeStartfilter;
  String? timeEndfilter;
  String? destination;
  int? numberOfDaysDes;

  static int valid = 0;
  List<DestinationsModel> destinations = [];

  // List<FilterModel>? filter = [];
  late CheckFlightModel checkFlightModel;
  Future<void> getCountriesAndAirlines() async {
    emit(LoadingOrganizingTrip());
    var response = await organizingTripImpl.getCitiesAndAirlines();

    response.fold(
        (failure) => emit(
              FailureOrganizingTrip(failure: failure),
            ), (response) {
      airlines = response['airlines'];
      for (var i = 0; i < response['cities'].length; i++) {
        cities.add(CountryModel.fromJson(response["cities"][i]));
        print(cities[i]);
      }
      emit(SuccessCheckAvailableFlight());
    });
  }

  Future<void> checkFlightsForTrip() async {
    emit(LoadingOrganizingTrip());
    tripGeneralInfo = TripOrgModel(
        startDate: startDate, numOfDays: numberDays, numOfSeats: numberPerson);
        print("pppppppppppppppppp");
        print(tripGeneralInfo.startDate);
    checkFlightModel = CheckFlightModel(
        source: source!,
        destinations: destinations,
        classOfSeat: classType!,
        isReturn: returnHome,
        daysTrip: numberDays!,
        startDate: startDate!);
    List<Map<String, dynamic>> destinationsoSend = [];

    for (var i = 0; i < destinations.length; i++) {
      destinationsoSend.add({
        "city": destinations[i].city,
        "days": destinations[i].days,
        "filter": {
          "time_start": destinations[i].filter?.timeStart,
          "time_end": destinations[i].filter?.timeEnd,
          "min_price": destinations[i].filter?.minPrice,
          "max_price": destinations[i].filter?.maxPrice,
          "airline": destinations[i].filter?.airline,
        }
      });
    }

    var response = await organizingTripImpl.checkFlightsForTrip(
        source: source!,
        destinations: destinationsoSend,
        startDate: startDate!,
        isReturn: returnHome,
        classType: classType!,
        daysTrip: numberDays!,
        numPersons: numberPerson!);
    response.fold(
        (failure) => emit(
              FailureOrganizingTrip(failure: failure),
            ), (res) {
      for (var i = 0; i < res['data'].length; i++) {
        availableFlightModel.add(AvailableFlightModel.fromJson(res["data"][i]));
        print(cities[i]);
      }
      print(availableFlightModel);
      emit(SuccessCheckAvailableFlight());
    });
  }

  void printDestinationsList() {
    for (var i = 0; i < destinations.length; i++) {
      print(" city : ${destinations[i].city}");
      print(" days: ${destinations[i].days}");
      print(" filter : ${destinations[i].filter?.airline} +"
          "${destinations[i].filter?.maxPrice}+"
          "${destinations[i].filter?.minPrice}"
          "${destinations[i].filter?.timeStart}+"
          "${destinations[i].filter?.timeEnd}");
    }
  }

  void deleteDestination(int index) {
    valid = valid - destinations[index].days;
    destinations.removeAt(index);
    emit(DeleteDestination());
  }

  void addDestination() {
    destinations.add(DestinationsModel(
        city: destination!,
        days: numberOfDaysDes!,
        filter: FilterModel(
            timeStart: null,
            timeEnd: null,
            airline: null,
            maxPrice: null,
            minPrice: null)));
    emit(AddDestination());
  }

  bool visibilityButton() {
    dynamic daysVisibility = 0;
    for (var i = 0; i < destinations.length; i++) {
      daysVisibility = daysVisibility + destinations[i].days;
    }
    if (daysVisibility == numberDays) {
      return true;
    } else {
      return false;
    }
  }

  bool destinationsDaysAreInValid() {
    int totalDays =
        destinations.fold(0, (sum, destination) => sum + destination.days);

    return valid > numberDays!;
  }

  void setdestination(String des) {
    this.destination = des;
  }

  void setNumberOfDaysDes(int numDays) {
    valid = valid + numDays;
    numberOfDaysDes = numDays;
  }

  void setNumberDays(int numDays) {
    numberDays = numDays;
  }

  void setNumberPerson(int numPerson) {
    numberPerson = numPerson;
  }

  void setStartDate(String startDate) {
    this.startDate = startDate;
    print(startDate);
  }

  void setReturnHome(bool returnhome) {
    this.returnHome = returnhome;
    print(startDate);
  }

  void setSoucre(String source) {
    this.source = source;
  }

  void setClassType(String classType) {
    this.classType = getClass(selectedClass: classType);
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

}
