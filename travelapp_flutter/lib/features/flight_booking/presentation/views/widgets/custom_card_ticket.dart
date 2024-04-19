import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CardTicket extends StatelessWidget {
  const CardTicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    return Container(
      padding: const EdgeInsets.all(16),
      height: screenHeight * 0.3,
      width: screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
            opacity: 0.8,
            image: AssetImage(
                "assets/images/greensky.png"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(
              child: AutoSizeText(
                "Syrian Airlines",
                style: TextStyle(color: Colors.white),
                softWrap: true,
                maxLines: 1,
                minFontSize: 9,
                maxFontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Departure",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const Flexible(
              child: AutoSizeText(
                "Aleppo International Airport",
                style: TextStyle(color: Colors.white),
                softWrap: true,
                maxLines: 1,
                minFontSize: 9,
                maxFontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Syria",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "2023/12/31",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            const Center(
              child: ClipOval(
                child: Icon(
                  FontAwesomeIcons.planeArrival,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            const Text(
              "Arrival",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const Flexible(
              child: AutoSizeText(
                "jeju International Airport",
                style: TextStyle(color: Colors.white),
                softWrap: true,
                maxLines: 1,
                minFontSize: 9,
                maxFontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Korea",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "2024/12/2",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(
                              FontAwesomeIcons.clock,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        TextSpan(
                            text: ' 3h ',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                  const Text(
                    "3000 \$",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Departure
//Arrival

// return SliverList.separated(
//   separatorBuilder: (context, index) => const Padding(
//     padding: EdgeInsets.symmetric(vertical: 8),
//     child: Divider(
//       thickness: 1,
//       height: 700,
//     ),
//   ),
//   itemCount: 2,
//   itemBuilder: (context, index) =>

//  Container(
//   padding: const EdgeInsets.all(10),
//   height: screenHeight * 0.3,
//   width: screenWidth,
//   decoration: const BoxDecoration(
//     image: DecorationImage(
//         opacity: 0.8,
//         image: AssetImage("assets/images/skycloud.jpg"),
//         fit: BoxFit.cover),
//     borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
//   ),
//   child: const Padding(
//     padding: EdgeInsets.all(16),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Flexible(
//           child: AutoSizeText(
//             "Syrian Airlines",
//             style: TextStyle(fontSize: 12, color: Colors.white),
//             softWrap: true,
//             maxLines: 3,
//             minFontSize: 9,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 8),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "src",
//                     style: TextStyle(fontSize: 15, color: Colors.white54),
//                   ),
//                   Text(
//                     "des",
//                     style: TextStyle(fontSize: 15, color: Colors.white54),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "syria",
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                   Text(
//                     "korea",
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Flexible(
//                     child: AutoSizeText(
//                       "Aleppo International Airport",
//                       maxFontSize: 11,
//                       softWrap: true,
//                       maxLines: 1,
//                       minFontSize: 9,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   VerticalDivider(),
//                   Flexible(
//                     child: AutoSizeText(
//                       "Jeju International Airport",
//                       maxFontSize: 11,
//                       softWrap: true,
//                       maxLines: 1,
//                       minFontSize: 9,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Divider(),
//               SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "2023/12/31",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                   Text(
//                     "5:30 am",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
//   // ),
// );
