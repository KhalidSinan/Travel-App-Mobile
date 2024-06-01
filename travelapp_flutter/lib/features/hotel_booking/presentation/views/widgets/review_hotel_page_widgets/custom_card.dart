import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class RoomCard2 extends StatelessWidget {
  const RoomCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      decoration: getRoomCardDecoration(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Room name',
                  style: Styles.heading.copyWith(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Deluxe',
                      style: Styles.content.copyWith(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.users,
                          color: Colors.grey[600],
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Themes.third,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          FontAwesomeIcons.bed,
                          color: Colors.grey[600],
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '2',
                          style: TextStyle(
                            color: Themes.third,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        FontAwesomeIcons.bugSlash,
                        size: 16,
                        color: Colors.white54,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Themes.third,
                      child: const Icon(
                        FontAwesomeIcons.banSmoking,
                        size: 20,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // button 
        ],
      ),
    );
  }

  BoxDecoration getRoomCardDecoration() {
    return BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: Themes.primary, width: 3),
    );
  }
}
