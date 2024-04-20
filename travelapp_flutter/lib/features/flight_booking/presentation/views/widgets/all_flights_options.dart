import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllFlightsOptions extends StatelessWidget {
  const AllFlightsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(),
          icon: const Icon(
            FontAwesomeIcons.filter,
            color: Color(0xffffb156),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.sliders,
            color: Color(0xffffb156),
          ),
        ),
      ],
    );
  }
}
