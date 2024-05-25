import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/all_hotelModel.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class AllHotelsCubit extends Cubit<AllHotelStates> {
  AllHotelsCubit(this._hotelBookingImp) : super(InitialAllHotelStates());

  int page = 1;
  int? stars;
  String? order;
  String? sortField;
  String? startDate;
  int? numDays;
  int? numRooms;
  final HotelBookingImp _hotelBookingImp;
  AllHotelModel? allhotels;

  Future<void> getAllHotelData({
    required String nameHotelOrCity,
    int? page,
    int? starsNumber,
    String? startDate,
    int? numDays,
    int? numRooms,
    String? sortField,
    String? order,
  }) async {
    emit(LoadingAllHotelStates());
    var response = await _hotelBookingImp.getAllHotelData(
        namecityOrhotelName: "Berlin",
        order: order,
        starsNumber: starsNumber,
        numDays: numDays,
        numRooms: numRooms,
        sortField: sortField,
        page: page,
        startdate: startDate);
    response.fold(
      (error) {
        emit(FailureGetAllHotelsState(failure: error));
      },
      (res) {
        allhotels = AllHotelModel.fromJson(res['data']);
        print(res['data']);
        emit(SuccessAllHotelStates());
      },
    );
  }

  Future<void> changePage(int page) async {
    this.page = page;
    await getAllHotelData(
        nameHotelOrCity: "Berlin",
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
        nameHotelOrCity: "Berlin",
        page: page,
        startDate: startDate,
        numDays: numDays,
        numRooms: numRooms);
  }

  Future<void> applyFilteringbyStars(int stars) async {
    this.stars = stars;
    await getAllHotelData(nameHotelOrCity: "Berlin", starsNumber: stars);
  }

  Future<void> applySorting(String sortField, String order) async {
    this.order = order;
    this.sortField = sortField;
    await getAllHotelData(
        nameHotelOrCity: "Berlin", sortField: sortField, order: order);
  }

  void restartSortingAndFiltering() {
    order = 'asc';
    sortField = 'price';
    stars = null;
  }
}
