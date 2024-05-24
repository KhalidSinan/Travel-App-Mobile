import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/review_hotel_cubit/review_hotel_states.dart';

class ReviewHotelCubit extends Cubit<ReviewHotelState> {
  
  final  HotelBookingImp hotelBookingImp;

  ReviewHotelCubit( this.hotelBookingImp) 
  : super(InitialReviewHotelState());

}
