import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';

class OurTeamPage extends StatelessWidget {
  const OurTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our Team",
            style:
                TextStyle(color: Themes.primary, fontWeight: FontWeight.bold)),
        leading: const CustomBackButton(),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Image.asset(
            'assets/images/Logo.jpg',
            height: 200,
          )),
          const SizedBox(
            height: 20,
          ),
          Text(
            'JourneyJoy\'s Team',
            style: Styles.heading2.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text('1.0.0'),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  ' Khaled Sinan Al-Nashi',
                  style: Styles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  ' Sara Yassin Najati ',
                  style: Styles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  ' Tima Ayman Dawa ',
                  style: Styles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  ' Mohammad Hamza Yousef Tinawi ',
                  style: Styles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  ' Abdulaziz Omran Aushar ',
                  style: Styles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  ' Alisar Ahmad Mayhoub ',
                  style: Styles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
