import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/room_type_chip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';

class RoomsSelectionTypesList extends StatefulWidget {
  const RoomsSelectionTypesList({
    super.key,
  });

  @override
  State<RoomsSelectionTypesList> createState() =>
      _RoomsSelectionTypesListState();
}

class _RoomsSelectionTypesListState extends State<RoomsSelectionTypesList> {
  late int selectedRoomType;
  List<String> roomTypeNames = ['Budget', 'Standard', 'Deluxe', 'Suite'];
  @override
  void initState() {
    super.initState();
    selectedRoomType = 0;
    BlocProvider.of<HotelReservationCubit>(context)
        .changeRoomType(selectedRoomType);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          4,
          (index) => Expanded(
            child: RoomTypeChip(
              typeName: roomTypeNames[index],
              onSelected: () {
                setState(() {
                  selectedRoomType = index;
                  BlocProvider.of<HotelReservationCubit>(context)
                      .changeRoomType(selectedRoomType);
                });
              },
              isSelected: selectedRoomType == index,
            ),
          ),
        ),
      ),
    );
  }
}
