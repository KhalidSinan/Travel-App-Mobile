import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: Themes.primary,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(100),
        ),
      ),
      child: Column(
        children: [
          const Stack(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person_rounded,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Sara Najati',
            style: Styles.heading2.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
