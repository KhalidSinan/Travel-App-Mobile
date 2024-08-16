import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class AnnouncementSubscribeSuccessPage extends StatefulWidget {
  const AnnouncementSubscribeSuccessPage({super.key});

  @override
  State<AnnouncementSubscribeSuccessPage> createState() =>
      _AnnouncementSubscribeSuccessPageState();
}

class _AnnouncementSubscribeSuccessPageState
    extends State<AnnouncementSubscribeSuccessPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.back();
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/check.json',
                height: 150,
                width: 150,
                repeat: false,
              ),
              Text(
                'Congrats!',
                style: Styles.heading2,
                textAlign: TextAlign.center,
              ),
              Text(
                'You\'re announcement request have been sent successfully, we will check it as soon as possible',
                style: Styles.subtitle.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
