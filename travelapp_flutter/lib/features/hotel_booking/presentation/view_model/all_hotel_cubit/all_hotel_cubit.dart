import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/all_hotels_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/next_destination_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class AllHotelsCubit extends Cubit<AllHotelStates> {
  AllHotelsCubit(this._hotelBookingImp) : super(InitialAllHotelStates());

  int page = 1;
  String? namecityOrhotelName;
  double stars = 0;
  String order = "asc";
  String sortField = "price";
  String? startDate;
  int? numDays;
  int? numRooms;
  final HotelBookingImp _hotelBookingImp;
  AllHotelModel? allhotels;
  List<NextDestinationModel> destinations = [];

  Future<void> getAllHotelData({
    required String nameHotelOrCity,
    int? page,
    double? starsNumber,
    String? startDate,
    int? numDays,
    int? numRooms,
    String? sortField,
    String? order,
  }) async {
    namecityOrhotelName = nameHotelOrCity;
    this.startDate = startDate;
    this.numDays = numDays;
    this.numRooms = numRooms;
    emit(LoadingAllHotelStates());
    var response = await _hotelBookingImp.getAllHotelData(
        namecityOrhotelName: nameHotelOrCity,
        order: order ?? "asc",
        starsNumber: starsNumber ?? 0,
        numDays: numDays ?? 1,
        numRooms: numRooms ?? 1,
        sortField: sortField ?? "nothing",
        page: page,
        startdate: startDate ?? '');
    response.fold(
      (error) {
        print(error.errMessage);
        emit(FailureGetAllHotelsState(failure: error));
      },
      (res) {
        print(res);
        if (res.isEmpty) {
          emit(NoHotelsState());
        }
        allhotels = AllHotelModel.fromJson(res['data']);
        print(res['data']);
        emit(SuccessAllHotelStates());
      },
    );
  }

  Future<void> changePage(int page) async {
    print(page);
    this.page = page;
    await getAllHotelData(
      nameHotelOrCity: namecityOrhotelName!,
      page: page,
      startDate: startDate,
      numDays: numDays,
      numRooms: numRooms,
      sortField: sortField,
      order: order,
    );
  }

  Future<void> retry() async {
    await getAllHotelData(
        nameHotelOrCity: namecityOrhotelName!,
        page: page,
        startDate: startDate,
        numDays: numDays,
        numRooms: numRooms);
  }

  Future<void> applyFilteringStars(double stars) async {
    this.stars = stars;
    Get.back();
    await getAllHotelData(
        nameHotelOrCity: namecityOrhotelName!, starsNumber: stars);
  }

  Future<void> applySorting(String sortField, String order) async {
    this.order = order;
    this.sortField = sortField;
    Get.back();
    await getAllHotelData(
        nameHotelOrCity: namecityOrhotelName!,
        sortField: sortField,
        order: order);
  }

  void restartSortingAndFiltering() {
    order = 'asc';
    sortField = 'nothing';
    stars = 0;
  }

  Future<void> nextDestination() async {
    var response = await _hotelBookingImp.getNextDestination();
    response.fold(
      (failure) {
        print(failure.errMessage);
        emit(
          FailureGetAllHotelsState(failure: failure),
        );
      },
      (res) {
        print(res['data']);
        for (int i = 0; i < res['data'].length; i++) {
          destinations.add(NextDestinationModel.fromJson(['data'][i]));
        }
        emit(SuccessAllHotelStates());
      },
    );
  }
}
