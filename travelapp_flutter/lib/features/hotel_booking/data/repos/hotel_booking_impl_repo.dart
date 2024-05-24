import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_repo.dart';

class HotelBookingImp extends HotelBookingRepo{
   final ApiService apiService;

  HotelBookingImp(this.apiService);
}