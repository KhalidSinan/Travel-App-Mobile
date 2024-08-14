import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/all_hotels_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservations_states.dart';

class HotelReservationCubit extends Cubit<HotelReservationState> {
  HotelReservationCubit(
    this._hotelBookingImp, {
    required this.city,
    required this.startDate,
    required this.numDays,
    required this.numRooms,
  }) : super(HotelReservationInitialState());

  final HotelBookingImp _hotelBookingImp;
  final String city, startDate;
  final int numDays, numRooms;
  int page = 1;
  AllHotelModel? hotels;

  List<RoomCartModel> selectedRooms = [];
  Map<String, dynamic> availableRooms = {};
  String selectedRoomType = "Budget";
  HotelModel? currentHotel;

  void changeRoomType(int roomTypeId) {
    switch (roomTypeId) {
      case 0:
        selectedRoomType = 'Budget';
      case 1:
        selectedRoomType = 'Standard';
      case 2:
        selectedRoomType = 'Deluxe';
      case 3:
        selectedRoomType = 'Suite';
      default:
        selectedRoomType = 'Budget';
    }
    emit(ChangeRoomTypeState());
  }

  Future<void> changePage(int newPage) async {
    page = newPage;
    await getAllHotels();
    emit(ChangePageState());
  }

  void addRoom(RoomCartModel roomCart) {
    for (var currRoomCart in selectedRooms) {
      if (currRoomCart.room.code == roomCart.room.code) {
        currRoomCart.count++;
        emit(AddRoom());
        return;
      }
    }
    selectedRooms.add(roomCart);
    availableRooms[roomCart.room.code!] = true;
    emit(AddRoom());
  }

  int getTotalRooms() {
    int totalRooms = 0;
    for (var element in selectedRooms) {
      totalRooms += element.count;
    }
    return totalRooms;
  }

  int getTotalNumberPages() {
    if (state is ChangePageState || state is HotelReservationSuccessState) {
      return (hotels!.totalHotels / flightsInSinglePage).ceil();
    } else {
      return 1;
    }
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var element in selectedRooms) {
      totalPrice += (element.room.price * element.count);
    }
    return totalPrice.toPrecision(2);
  }

  void removeRoom(RoomCartModel room) {
    RoomCartModel selectedRoom = selectedRooms
        .where((element) => element.room.code == room.room.code)
        .first;
    if (selectedRoom.count == 1) {
      selectedRooms.remove(selectedRoom);
      emit(DeleteRoom());
      return;
    }
    selectedRoom.count--;
    emit(DeleteRoom());
  }

  Future<void> getAllHotels() async {
    emit(HotelReservationLoadingState());
    var response = await _hotelBookingImp.getHotelsByCity(
      city: city,
      startDate: startDate,
      numDays: numDays,
      numRooms: numRooms,
      page: page,
    );
    response.fold(
      (l) {
        emit(HotelReservationFailureState());
      },
      (res) {
        if (res['data']['totalHotelsFound'] == 0) {
          emit(NoHotelsState());
          return;
        }
        hotels = AllHotelModel.fromJson(res['data']);
        print(res['data']);
        emit(HotelReservationSuccessState());
      },
    );
  }

  void onNext() {
    emit(NextPageState());
  }

  void onPrevious({bool deleteRooms = false}) {
    if (deleteRooms) {
      selectedRooms = [];
    }
    emit(PreviousPageState());
  }
}
