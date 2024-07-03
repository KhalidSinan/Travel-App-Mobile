import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_reservation_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_states.dart';

class HotelInformationCubit extends Cubit<HotelInformationState> {
  HotelInformationCubit(super.initialState);

  HotelReservationModel? allHotels;
}
