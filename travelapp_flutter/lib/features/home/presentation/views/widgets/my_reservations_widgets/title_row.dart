import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key, required this.title, this.onPressed, required this.type});
  final String title, type;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              color: Themes.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if(type == 'latest')
          GestureDetector(
            onTap: onPressed,
            child: Row(
              children: [
                Text(
                  'See all',
                  style: TextStyle(color: Themes.primary),
                ),
                Icon(Icons.keyboard_arrow_right, color: Themes.primary)
              ],
            ),
          )
        ],
      ),
    );
  }
}
