import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../core/utils/assets.dart';

Widget _buildFullscreenImage() {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
    child: Image.asset(
      'lib/core/utils/assets/onBoarding_images/22.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    ),
  );
}

var pageDecoration = PageDecoration(
    titleTextStyle: const TextStyle(
        fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
    bodyTextStyle: const TextStyle(fontSize: 19.0, color: Colors.white),
    bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: const Color(0xff0e3311).withOpacity(0.5),
    imagePadding: EdgeInsets.zero);

List<PageViewModel> pagesList = [
  PageViewModel(
      titleWidget: const Text(
        "Find Your Destination ",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      body:
          "All tourist destinations are in your \n hands just click and find the \n convenience now in phone ",
      image: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(fit: BoxFit.fill, Assets.one),
      )),
  PageViewModel(
      titleWidget: const Text(
        " Start Your Journey ",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      body:
          "from this seconde you will find an \n amzing and diverse journey \n through the grip and click ",
      image: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          Assets.two,
          fit: BoxFit.fill,
        ),
      )),
  PageViewModel(
      titleWidget: const Text(
        " Travel The World ",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      body:
          " Explore different places in \n different countries and find many \n surpises always by your side ",
      image: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          Assets.three,
          fit: BoxFit.fill,
        ),
      )),
  PageViewModel(
    title: "Full Screen Page",
    body:
        "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod rum rhoncus est ac venenatis.",
    image: _buildFullscreenImage(),
    decoration: pageDecoration.copyWith(
      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
      fullScreen: true,
      bodyFlex: 2,
      imageFlex: 5,
      safeArea: 100,
    ),
  ),
];
