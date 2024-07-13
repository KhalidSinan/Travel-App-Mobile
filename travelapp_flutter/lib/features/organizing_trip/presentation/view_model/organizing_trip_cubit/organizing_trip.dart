import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  int? numberDays = 1;
  int? numberPerson = 1;
  String? startDate;
  bool returnHome = false;
  RangeValues? prices = const RangeValues(0, 1500);
  String? airlinefilter;
  String? timeStartfilter;
  String? timeEndfilter;
  String? destination;
  int? numberOfDaysDes;

  int valid = 0;
  List<DestinationsModel> destinations = [];
  List<String> startDates = [];
  Map<String, List<Map<String, List<PlaceModel?>>>> tripSchedule = {};
  List<int> currentSteps = [];

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
      }
      emit(SuccessCheckAvailableFlight());
    });
  }

  Future<void> checkFlightsForTrip() async {
    emit(LoadingOrganizingTrip());
    tripGeneralInfo = TripOrgModel(
        startDate: startDate, numOfDays: numberDays, numOfSeats: numberPerson);
    // print("pppppppppppppppppp");
    // print(tripGeneralInfo.startDate);
    printDestinationsList();
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
      availableFlightModel = [];
      destinationsoSend = [];
      for (var i = 0; i < res['data'].length; i++) {
        availableFlightModel.add(AvailableFlightModel.fromJson(res["data"][i]));
        // print(cities[i]);
      }
      print(destinations);
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
    destinations.removeAt(index);
    emit(DeleteDestination());
  }

  void addDestination() {
    if (saveValidDestination(destinations, numberOfDaysDes)) {
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
  }

  bool saveValidDestination(
      List<DestinationsModel> destinations, numberOfDaysDestinaton) {
    dynamic daysVisibility = 0;
    for (var i = 0; i < destinations.length; i++) {
      daysVisibility = daysVisibility + destinations[i].days;
    }
    if (daysVisibility + numberOfDaysDestinaton > numberDays) {
      return false;
    }
    return true;
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

  // bool destinationsDaysAreInValid() {
  //   print("numberValide ${valid}");
  //   return valid > numberDays!;
  // }

  void setdestination(String des) {
    destination = des;
  }

  void setNumberOfDaysDes(int numDays) {
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
  }

  void setReturnHome(bool returnhome) {
    returnHome = returnhome;
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

  void getStartDate() {
    startDates.add(startDate!);
    calculateStartDate();
  }

  void calculateStartDate() {
    for (var i = 0; i < destinations.length - 1; i++) {
      DateTime dateTime = DateTime.parse(startDates[i]);
      DateTime date = dateTime.add(Duration(days: destinations[i].days));
      DateFormat outputFormat = DateFormat('dd/MM/yyyy');
      String formattedDate = outputFormat.format(date);
      startDates.add(formattedDate);
    }
  }

void createCurrentSteps(){

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
  }

  void deleteFromTripSchedule(String city, int step, int i) {
    tripSchedule[city]![step]['day${step + 1}']!.removeAt(i);
  }
}
