import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class HotelsList extends StatelessWidget {
  const HotelsList({super.key});

  @override
  Widget build(BuildContext context) {
    double rating = 3.5;
    return SliverList.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Themes.primary),
                borderRadius: BorderRadius.circular(15),
                color: Themes.secondary,
              ),
              width: MediaQuery.sizeOf(context).width,
              height: 190,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9, 8, 8, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        fit: BoxFit.fill,
                        "assets/images/hotel.jpg",
                        height: 130,
                        width: 140,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, right: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Flexible(
                          child: AutoSizeText(
                            "Chillax Heritage",
                            softWrap: true,
                            maxLines: 1,
                            minFontSize: 10,
                            maxFontSize: 18,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Flexible(
                          child: AutoSizeText(
                            "Baramkeh Road | 4.5 Km from center",
                            softWrap: true,
                            maxLines: 1,
                            minFontSize: 7,
                            maxFontSize: 11,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < rating ? Icons.star : Icons.star_border,
                              color:
                                  index < rating ? Colors.yellow : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          children: [
                            Text(
                              "start from : ",
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              "US \$304",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
