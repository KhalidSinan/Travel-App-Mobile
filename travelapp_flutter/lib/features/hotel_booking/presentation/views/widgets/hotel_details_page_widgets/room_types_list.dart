import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/room_type_chip.dart';

class RoomTypesList extends StatefulWidget {
  const RoomTypesList({
    super.key,
  });

  @override
  State<RoomTypesList> createState() => _RoomTypesListState();
}

class _RoomTypesListState extends State<RoomTypesList> {
  late int selectedRoomType;
  List<String> roomTypeNames = ['Budget', 'Standard', 'Deluxe', 'Suite'];
  @override
  // ignore: must_call_super
  void initState() {
    selectedRoomType =
        BlocProvider.of<HotelDetailsCubit>(context).selectedRoomType;
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
                  BlocProvider.of<HotelDetailsCubit>(context)
                      .changeRoomType(index);
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
