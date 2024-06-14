import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.7),
          Text(
            'Next',
            style: TextStyle(color: Themes.primary, fontSize: 25),
          ),
          const SizedBox(width: 10),
          Icon(
            FontAwesomeIcons.arrowRight,
            color: Themes.primary,
            size: 25,
          )
        ],
      ),
    );
  }
}
