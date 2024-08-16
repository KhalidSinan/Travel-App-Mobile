import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.photo,
    required this.fname,
    required this.lname,
  });
  final String fname, lname;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: Themes.primary,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(80),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.grey,
            backgroundImage: photo != null
                ? NetworkImage('${getIt.get<ApiService>().baseUrl}/$photo')
                : null,
            child: photo == null
                ? const Icon(
                    Icons.person_rounded,
                    size: 100,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(height: 22),
          Text(
            '$fname $lname',
            style: Styles.heading2.copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
