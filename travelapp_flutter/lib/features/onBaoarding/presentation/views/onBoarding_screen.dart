import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding/feature/onBaoarding/data/models/pages_list.dart';
import 'package:onboarding/feature/onBaoarding/presentation/views/login_tesst.dart';
import 'package:onboarding/feature/onBaoarding/presentation/widget/custom_container_next.dart';
import 'package:onboarding/feature/onBaoarding/presentation/widget/custom_text_done.dart';
import 'package:onboarding/feature/onBaoarding/presentation/widget/custom_text_skip.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: pagesList,
        onDone: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }));
        },
        onSkip: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }));
        },
        showSkipButton: true,
        next: const CustomContainerNext(),
        skip: const CustomTextSkip(),
        done: const CustomtTextdone(),
        dotsDecorator: DotsDecorator(
            activeSize: const Size(30, 10),
            color: Colors.black26,
            activeColor: const Color(0xff6c63ff),
            spacing: const EdgeInsets.symmetric(horizontal: 3),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
      )),
    );
  }
}
