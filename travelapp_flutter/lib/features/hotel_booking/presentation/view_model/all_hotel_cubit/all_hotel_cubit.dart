import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class AllHotelsCubit extends Cubit<AllHotelStates> {
  AllHotelsCubit(this._hotelBookingImp) : super(InitialAllHotelStates());

  final HotelBookingImp _hotelBookingImp;
}
