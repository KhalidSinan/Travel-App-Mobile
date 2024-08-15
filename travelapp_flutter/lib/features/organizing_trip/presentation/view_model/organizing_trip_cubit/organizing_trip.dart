import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/available_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/check_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/filtering_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_reservation_model.dart';
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
  String? sourceCity, sourceCountry;
  String? classType;
  int? numberDays = 1;
  int? numberPerson = 1;
  String? startDate;
  bool returnHome = false;
  RangeValues? prices = const RangeValues(0, 1500);
  String? airlinefilter;
  String? timeStartfilter;
  String? timeEndfilter;
  String? destinationCity, destinationCountry;
  int? numberOfDaysDes;

  String? profit, desc;
  List<String>? types;
  int valid = 0;
  List<DestinationsModel> destinations = [];
  List<String> startDates = [];
  Map<String, List<Map<String, List<PlaceModel?>>>> tripSchedule = {};
  HotelReservationModel? allHotels;

  // List<FilterModel>? filter = [];
  late CheckFlightModel checkFlightModel;

  void setTripInfo({
    required List<String> types,
    required String profit,
    required String desc,
  }) {
    this.desc = desc;
    this.profit = profit;
    this.types = types;
  }

  Future<void> getCountriesAndAirlines() async {
    print('here');
    emit(LoadingOrganizingTrip());
    var response = await organizingTripImpl.getCitiesAndAirlines();

    response.fold(
        (failure) => emit(
              FailureOrganizingTrip(failure: failure),
            ), (response) {
      airlines = response['airlines'];
      cities = [];
      for (var i = 0; i < response['cities'].length; i++) {
        cities.add(CountryModel.fromJson(response["cities"][i]));
      }
      print(response);
      emit(SuccessCheckAvailableFlight());
    });
  }

  Future<void> checkFlightsForTrip() async {
    emit(LoadingOrganizingTrip());
    tripGeneralInfo = TripOrgModel(
      startDate: startDate,
      numOfDays: numberDays,
      numOfSeats: numberPerson,
    );
    printDestinationsList();
    checkFlightModel = CheckFlightModel(
      source: sourceCity!,
      destinations: destinations,
      classOfSeat: classType!,
      isReturn: returnHome,
      daysTrip: numberDays!,
      startDate: startDate!,
    );
    List<Map<String, dynamic>> destinationsoSend = [];

    for (var i = 0; i < destinations.length - (returnHome ? 1 : 0); i++) {
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
        source: sourceCity!,
        destinations: destinationsoSend,
        startDate: startDate!,
        isReturn: returnHome,
        classType: classType!,
        daysTrip: numberDays!,
        numPersons: numberPerson!);
    response.fold(
      (failure) => emit(
        FailureOrganizingTrip(failure: failure),
      ),
      (res) {
        availableFlightModel = [];
        destinationsoSend = [];
        print('===================');
        print(res['data']);
        for (var i = 0; i < res['data'].length; i++) {
          availableFlightModel
              .add(AvailableFlightModel.fromJson(res["data"][i]));
        }
        emit(SuccessCheckAvailableFlight());
      },
    );
  }

  double getTotalFlightsPrice() {
    double totalPrice = 0;
    for (var flight in availableFlightModel) {
      totalPrice += flight.flight!.price;
    }
    return totalPrice.toPrecision(2);
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
    if (index < availableFlightModel.length) {
      availableFlightModel.removeAt(index);
    }
    emit(DeleteDestination());
  }

  double getTotalTripPrice() {
    // return 9.00;
    return getTotalFlightsPrice() + allHotels!.getAllHotelsPrice();
  }

  void addDestination() {
    if (saveValidDestination(destinations, numberOfDaysDes)) {
      destinations.add(DestinationsModel(
          country: destinationCountry!,
          city: destinationCity!,
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

  void saveHotels({required HotelReservationModel allHotels}) {
    this.allHotels = allHotels;
  }

  // bool destinationsDaysAreInValid() {
  //   print("numberValide ${valid}");
  //   return valid > numberDays!;
  // }

  void setDestinationCity(String des) {
    destinationCity = des;
  }

  void setDestinationCountry(String des) {
    destinationCountry = des;
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
    destinations.removeWhere((destination) => destination.city == sourceCity);
    if (returnHome) {
      destinations.add(DestinationsModel(
        city: sourceCity!,
        country: sourceCountry!,
        days: 0,
      ));
    }
  }

  void setSourceCity(String source) {
    sourceCity = source;
  }

  void setSourceCountry(String source) {
    sourceCountry = source;
  }

  void setClassType(String classType) {
    this.classType = getClass(selectedClass: classType);
  }

  void setPlaces(List<PlaceModel> places) {
    this.places = places;
  }

  void setTripSchedule(
      Map<String, List<Map<String, List<PlaceModel?>>>> tripSchedule) {
    this.tripSchedule = tripSchedule;
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

  String getSeatClass() {
    switch (classType) {
      case 'A':
        return 'First Class';
      case 'B':
        return 'Business Class';
      case 'C':
        return 'Economy Class';
      default:
        return '';
    }
  }

  void getStartDate() {
    startDates = [];
    startDates.add(startDate!);
    calculateStartDate();
  }

  void calculateStartDate() {
    for (var i = 0; i < destinations.length - 1; i++) {
      DateTime dateTime = DateFormat('dd/MM/yyyy').parse(startDates[i]);
      // String formattedInputDate = DateFormat('yyyy-MM-dd').format(inputDate);
      // DateTime dateTime = DateTime.parse(startDates[i]);
      DateTime date = dateTime.add(Duration(days: destinations[i].days));
      DateFormat outputFormat = DateFormat('dd/MM/yyyy');
      String formattedDate = outputFormat.format(date);
      startDates.add(formattedDate);
    }
  }

  List<List<Map<String, String>>> getAllPlacesForDestination({
    required String destination,
  }) {
    var days = tripSchedule[destination];
    List<List<Map<String, String>>> places = [];
    for (var day in days!) {
      day.forEach((key, newPlaces) {
        List<Map<String, String>> formattedPlaces = [];
        for (var place in newPlaces) {
          formattedPlaces.add(place!.toJson());
        }
        places.addAll([formattedPlaces]);
      });
    }
    return places;
  }

  void onNext({int? page}) {
    emit(NextPageState(page));
  }

  void onPrevious() {
    emit(PreviousPageState());
  }
}
