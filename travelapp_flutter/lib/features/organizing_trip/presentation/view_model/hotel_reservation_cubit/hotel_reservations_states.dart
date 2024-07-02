abstract class HotelReservationState {}

class HotelReservationInitialState extends HotelReservationState {}

class ChangeRoomTypeState extends HotelReservationState {}

class AddRoom extends HotelReservationState {}

class DeleteRoom extends HotelReservationState {}

class HotelReservationLoadingState extends HotelReservationState {}

class HotelReservationFailureState extends HotelReservationState {}

class HotelReservationSuccessState extends HotelReservationState {}

class NoHotelsState extends HotelReservationState {}
