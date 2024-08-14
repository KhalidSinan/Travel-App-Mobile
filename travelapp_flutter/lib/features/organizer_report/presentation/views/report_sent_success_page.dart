import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class ReportSentSuccessPage extends StatelessWidget {
  const ReportSentSuccessPage({super.key});

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
                'You\'re report request have been sent successfully, we will check it as soon as possible',
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
