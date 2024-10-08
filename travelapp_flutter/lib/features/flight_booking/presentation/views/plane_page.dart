import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/main_container.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/top_container.dart';

class PlanePage extends StatefulWidget {
  const PlanePage({super.key});

  @override
  State<PlanePage> createState() => _PlanePageState();
}

class _PlanePageState extends State<PlanePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          children: [
            TopContainer(),
            Positioned(
              top: 30,
              left: 6,
              child: CustomBackButton(
                color: Colors.white,
              ),
            ),
            MainContainer(),
          ],
        ),
      ),
    );
  }
}











  // Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 30),
  //                       child: Column(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.symmetric(horizontal: 10.0),
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [Text('From'), Text("To")],
  //                             ),
  //                           ),
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Card(
  //                                   shape: RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(12)),
  //                                   elevation: 5,
  //                                   child: Container(
  //                                     width: 130,
  //                                     height: 40,
  //                                     decoration: BoxDecoration(
  //                                         color: Colors.black.withOpacity(0.1),
  //                                         borderRadius:
  //                                             BorderRadius.circular(12)),
  //                                     child: const Center(child: Text("ssss")),
  //                                   )),
  //                               IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.compare_arrows_sharp,
  //                                     size: 40,
  //                                   )),
  //                               Card(
  //                                   shape: RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(12)),
  //                                   elevation: 5,
  //                                   child: Container(
  //                                     width: 130,
  //                                     height: 40,
  //                                     decoration: BoxDecoration(
  //                                         color: Colors.black.withOpacity(0.1),
  //                                         borderRadius:
  //                                             BorderRadius.circular(12)),
  //                                     child: const Center(child: Text("ssss")),
  //                                   )),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                     ),