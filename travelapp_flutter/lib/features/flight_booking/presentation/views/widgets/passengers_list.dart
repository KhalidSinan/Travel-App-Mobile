import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:info_widget/info_widget.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class PassengersList extends StatelessWidget {
  const PassengersList({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return SliverFixedExtentList(
      itemExtent: 100,
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, int index) => Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12.withOpacity(0.05),
          ),
          width: screenWidth,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        FontAwesomeIcons.person,
                        color: Themes.primary,
                        size: 20,
                      ),
                    ),
                    const TextSpan(
                      text: ' Tima Dawaa ',
                      style:
                          TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ]),
                ),
                InfoWidget(
                    infoText:
                        "seat class ${5}\n passport ${112564853} \n price : 500\$ ",
                    iconData: FontAwesomeIcons.info,
                    iconColor: Themes.primary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
