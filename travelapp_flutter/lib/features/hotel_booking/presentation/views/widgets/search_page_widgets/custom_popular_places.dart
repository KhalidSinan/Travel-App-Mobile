import 'package:flutter/material.dart';

class PopularCitys extends StatelessWidget {
  const PopularCitys({super.key, required this.image, required this.city});
  final String image;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 130,
            width: 130,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              city,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
