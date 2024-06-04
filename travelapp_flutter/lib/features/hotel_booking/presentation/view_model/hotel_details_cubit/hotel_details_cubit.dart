import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_states.dart';

class HotelDetailsCubit extends Cubit<HotelDetailsStates> {
  HotelDetailsCubit(this.hotel) : super(InitialHotelDetailsState());
  final HotelModel hotel;
  List<RoomTypeModel> selectedRooms = [];

  void addRoom(RoomTypeModel room) {
    selectedRooms.add(room);
    emit(AddRoom());
  }
}
