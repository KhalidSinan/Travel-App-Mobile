import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';

class ConfirmationStepButtons extends StatelessWidget {
  const ConfirmationStepButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Themes.primary.withOpacity(0.9),
            ),
          ),
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: CustomTextButton(
                onPressed: () {},
                label: "Later",
              )),
              Expanded(
                  child: CustomButton(
                onPressed: () {},
                label: "Confirm",
                isFlat: true,
              )),
            ],
          ),
        ));
  }
}
