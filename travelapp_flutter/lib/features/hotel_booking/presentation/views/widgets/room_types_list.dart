import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/room_type_chip.dart';

class RoomTypesList extends StatefulWidget {
  const RoomTypesList({
    super.key,
  });

  @override
  State<RoomTypesList> createState() => _RoomTypesListState();
}

class _RoomTypesListState extends State<RoomTypesList> {
  int selectedRoomType = 0;
  List<String> roomTypeNames = ['Suite', 'Deluxe', 'Standard', 'Budget'];
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
