import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_for_destination_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_reservation_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_states.dart';

class HotelInformationCubit extends Cubit<HotelInformationState> {
  HotelInformationCubit(super.initialState, {required this.destinations});

  final int destinations;
  int currentHotel = 0;
  late HotelReservationModel allHotels;

  void initialize() {
    allHotels = HotelReservationModel(
      hotels: List.filled(destinations, null),
      totalPrice: 0,
    );
  }

  void onHotelTap({required int index}) {
    currentHotel = index;
  }

  void addHotelReservationForDestination({
    required String city,
    required String hotelName,
    required String hotelId,
    required String hotelImage,
    required String hotelLocation,
    required int hotelStars,
    required double distanceFromCityCenter,
    required List<RoomCartModel> selectedRooms,
    required String startDate,
    required int numDays,
    required double totalPrice,
  }) {
    HotelForDestinationModel choosenHotel = HotelForDestinationModel(
      destination: city,
      hotelName: hotelName,
      hotelImage: hotelImage,
      hotelLocation: hotelLocation,
      hotelStars: hotelStars,
      distanceFromCityCenter: distanceFromCityCenter,
      hotelId: hotelId,
      rooms: selectedRooms,
      startDate: startDate,
      numDays: numDays,
      totalPrice: totalPrice,
    );
    allHotels.hotels[currentHotel] = choosenHotel;
    emit(addHotelState());
  }
}
