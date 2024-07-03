import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/profile_header.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/user_data.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileHeader(),
        SizedBox(height: 30),
        UserData(
          icon: Icons.email_outlined,
          text: 'saranajati@gmail.com',
        ),
        UserData(
          icon: Icons.call_outlined,
          text: '+963 958779283',
          edit: true,
        ),
        UserData(
          icon: Icons.location_on_outlined,
          text: 'Damascus, Syria',
          edit: true,
        ),
        UserData(
          icon: Icons.female_outlined,
          text: 'Female',
        ),
        UserData(
          icon: Icons.calendar_today_outlined,
          text: '31 Dec 2003',
        ),
      ],
    );
  }
}
