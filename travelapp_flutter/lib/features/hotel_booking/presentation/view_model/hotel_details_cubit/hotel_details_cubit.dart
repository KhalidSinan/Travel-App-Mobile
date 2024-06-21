import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_states.dart';

class HotelDetailsCubit extends Cubit<HotelDetailsStates> {
  HotelDetailsCubit(this.hotel, this.rooms, this.startDate, this.numDays,
      this.hotelBookingImp)
      : super(InitialHotelDetailsState());

  final HotelBookingImp hotelBookingImp;
  final HotelModel hotel;
  final List<RoomTypeModel> rooms;
  int selectedRoomType = 0;
  String? startDate, numDays;
  List<RoomCartModel> selectedRooms = [];
  Map<String, bool> availableRooms = {};

  void changeRoomType(int roomTypeId) {
    selectedRoomType = roomTypeId;
    emit(FilterRoomType());
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

  void removeRooms(List<RoomCartModel> deletedRooms) {
    for (var room in deletedRooms) {
      selectedRooms.remove(room);
    }
    emit(DeleteRoom());
  }

  void removeRoom(RoomCartModel room) {
    RoomCartModel selectedRoom = selectedRooms
        .where((element) => element.room.code == room.room.code)
        .first;
    if (selectedRoom.count > 1) {
      selectedRoom.count--;
    }
    emit(DeleteRoom());
  }

  int getTotalRooms() {
    int totalRooms = 0;
    for (var element in selectedRooms) {
      totalRooms += element.count;
    }
    return totalRooms;
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var element in selectedRooms) {
      totalPrice += (element.room.price * element.count);
    }
    return totalPrice.toPrecision(2);
  }

  Future<void> makeHotelReservation({
    required List<Map<String, dynamic>> roomCodes,
    required String startDate,
    required String numDays,
  }) async {
    emit(LoadingReviewHotelState());
    var response = await hotelBookingImp.makeHotelReservation(
      hotelId: hotel.id,
      roomCodes: roomCodes,
      startDate: startDate,
      numDays: numDays,
    );
    response.fold((failure) {
      if (failure.errType == DioExceptionType.badResponse) {
        for (var room in failure.errMessage) {
          if (availableRooms.containsKey(room["code"])) {
            availableRooms[room["code"]] = false;
          }
        }
        emit(RoomsFailureReviewHotelState(failure: availableRooms));
      } else {
        emit(FailureReviewHotelState(failure: failure));
      }
    }, (res) {
      print(res);
      emit(SuccessReviewHotelState());
    });
  }
}
