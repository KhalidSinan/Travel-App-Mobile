import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class RoomTypeChip extends StatelessWidget {
  const RoomTypeChip({
    super.key,
    required this.typeName,
    required this.onSelected,
    required this.isSelected,
  });

  final String typeName;
  final VoidCallback onSelected;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Themes.secondary,
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                  color: Themes.third,
                  width: 3,
                ))
              : null,
        ),
        child: Text(
          typeName,
          style: Styles.subtitle.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
