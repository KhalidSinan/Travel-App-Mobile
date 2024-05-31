import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/review_hotel_cubit/make_hotel_reservation_states.dart';

class MakeHotelReservationCubit extends Cubit<MakeHotelReservationState> {
  final HotelBookingImp hotelBookingImp;
  String? starDate , numOfDays;
  // يوجد تعديل بناء على المصفوفة القادمة من خالد
  List<RoomTypeModel>? rooms;
  Map<String, bool> availableRooms = {};

  MakeHotelReservationCubit(this.hotelBookingImp)
      : super(InitialReviewHotelState());

  Future<void> makeHotelReservation(
      {required String hotelId,
      required List<Map<String, dynamic>> roomCodes,
      required String startDate,
      required String numDays}) async {
    var response = await hotelBookingImp.makeHotelReservation(
        hotelId: hotelId,
        roomCodes: roomCodes,
        startDate: startDate,
        numDays: numDays);

    response.fold((failure) {
      emit(FailureReviewHotelState(failure: failure));
    }, (res) {
      emit(SuccessReviewHotelState());
    });
  }
}
