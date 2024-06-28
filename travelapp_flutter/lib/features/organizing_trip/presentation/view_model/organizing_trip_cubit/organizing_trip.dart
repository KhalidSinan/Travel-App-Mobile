import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/check_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';

import '../../../data/models/cities_airline_model.dart';

class OrganizingTripCubit extends Cubit<OrganizingTripStates> {
  OrganizingTripCubit(this.organizingTripImpl) : super(InitialOrganizingTrip());

  final OrganizingTripImpl organizingTripImpl;

  List<CheckFlightModel>? checkFlights;

  List<dynamic> airlines = [];
  List<CountryModel> cities = [];
  // CountryModel cc;
  String? seatClass;
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
      print(airlines);
      print("&&&&&&&&&&&&&&&&&&&&&&&&&7");
      print(cities);
      emit(SuccessCheckAvailableFlight());
    });
  }

  void getClass({required String selectedClass}) {
    switch (selectedClass) {
      case 'First':
        seatClass = 'A';
      case 'Business':
        seatClass = 'B';
      case 'Economy':
        seatClass = 'C';
    }
  }
}
