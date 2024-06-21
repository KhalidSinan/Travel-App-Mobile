import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/step_three_(travelDestinationFilter).dart';

class ListDestinationView extends StatelessWidget {
  const ListDestinationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Destination ${index + 1} : Korea",
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "NumberDays : 5",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          iconSize: 23,
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.trash,
                            color: Colors.redAccent,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(const DestinaionsFilterPage());
                          },
                          icon: Icon(
                            FontAwesomeIcons.chevronRight,
                            color: Themes.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
