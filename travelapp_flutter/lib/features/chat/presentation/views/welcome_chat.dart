import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';

class WelcomeChat extends StatelessWidget {
  const WelcomeChat({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = screenHeight > screenWidth;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: isPortrait ? screenHeight * 0.3 : screenHeight * 0.5,
                child: Lottie.asset("assets/animations/chat.json"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Text(
                  "Do you want to create a conversation that joins all travelers?",
                  style: Styles.heading2.copyWith(
                    fontSize: screenWidth * 0.05,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 8, top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomTextButton(onPressed: () {}, label: "Later"),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomButton(
                        onPressed: () {},
                        label: "YES",
                        isFlat: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
