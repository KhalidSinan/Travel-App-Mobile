import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height * 0.30,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayInterval: const Duration(seconds: 15),
        scrollPhysics: const NeverScrollableScrollPhysics(),
      ),
      items: List.generate(
        images.length,
        (index) => buildImage(images[index]),
      ),
    );
  }

  Widget buildImage(String imageUrl) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
