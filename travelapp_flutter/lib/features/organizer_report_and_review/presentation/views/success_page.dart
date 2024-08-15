import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({
    super.key,
    required this.content,
    required this.title,
  });

  final String content;
  final String title;

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
                title,
                style: Styles.heading2,
                textAlign: TextAlign.center,
              ),
              Text(
                content,
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
