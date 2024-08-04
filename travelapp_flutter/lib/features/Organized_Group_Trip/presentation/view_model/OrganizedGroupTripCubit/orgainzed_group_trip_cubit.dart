import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';

class OrganizedGroupCubit extends Cubit<OrganizedGroupCubitState> {
  OrganizedGroupCubit(this.organizingGroupTripImpl)
      : super(OrganizedGroupTripInitialState()) {
    // selectedTypes = [];
    // selectedCountries = [];
  }

  final OrganizingGroupTripImpl organizingGroupTripImpl;
  List<AllOrganizedGroupTrip> allOrganizedGroupTrip = [];
  List<String> allCountries = [];

  String? source;
  int page = 1;
  String? startDate;
  String? endDate;
  double? minPrice;
  double? maxPrice;
  List<String> selectedTypes = [];
  List<String> selectedCountries = [];
  int count = 0;

  void updateSelectedTypes(String type, bool isSelected) {
    if (isSelected) {
      selectedTypes.add(type);
    } else {
      selectedTypes.remove(type);
    }
    emit(OrganizedGroupCubitUpdated(List.from(selectedTypes)));
  }

  void updateSelectedCountries(String country, bool isSelected) {
    if (isSelected) {
      selectedCountries.add(country);
    } else {
      selectedCountries.remove(country);
    }
    emit(OrganizedGroupCubitUpdated(List.from(selectedCountries)));
  }

  Future<void> getAllCountries() async {
    emit(LoadingOrganizedGroupTripState());
    final response = await organizingGroupTripImpl.getAllCountries();
    response.fold(
        (failure) => emit(FailureOrganizedGroupTripState(failure: failure)),
        (response) {
      allCountries = List<String>.from(response['data']);
      emit(SuccessOrganizedGroupTripState());
    });
  }

  Future<void> getAllOrganizedTrips({
    String? tab,
    int? page,
    String? source,
    String? startDate,
    String? endDate,
    double? startPrice,
    double? endPrice,
    List<String>? types,
    List<String>? countries,
  }) async {
    allOrganizedGroupTrip = [];
    emit(LoadingOrganizedGroupTripState());
    final response = await organizingGroupTripImpl.getAllOrganizedTrips(
      page: page ?? 1,
      source: source ?? "",
      tab: tab ?? "All",
      startDate: startDate ?? "",
      endDate: endDate ?? "",
      startPrice: startPrice ?? 0,
      endPrice: endPrice ?? 0,
      types: types ?? [],
      countries: countries ?? [],
    );
    response.fold(
        (failure) => emit(FailureOrganizedGroupTripState(failure: failure)),
        (response) {
      count = response['count'];
      print(count);
      for (var item in response["data"]) {
        allOrganizedGroupTrip.add(AllOrganizedGroupTrip.fromJson(item));
      }
      emit(SuccessOrganizedGroupTripState());
    });
  }

  Future<void> changePage(int page) async {
    this.page = page;
    await getAllOrganizedTrips(page: page);
  }
}
