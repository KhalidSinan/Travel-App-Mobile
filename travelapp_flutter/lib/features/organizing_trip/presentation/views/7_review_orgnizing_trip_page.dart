import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/review_orgnizing_trip_body.dart';

class ReviewOrgnizingTrip extends StatelessWidget {
  const ReviewOrgnizingTrip({super.key});

  @override
  Widget build(BuildContext context) {
    final trip = BlocProvider.of<OrganizingTripCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(290),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(25)),
              color: Themes.primary,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(
                      color: Colors.white,
                      onBack: BlocProvider.of<OrganizingTripCubit>(context)
                          .onPrevious,
                    ),
                    const CustomStepCircular(
                      progress: 0.875,
                      text: "7/8",
                      //color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "General Informations About Your Trip",
                  style: TextStyle(
                      color: Themes.third,
                      fontWeight: FontWeight.w200,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trip Days : ${trip.numberDays}",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "Start Date : ${trip.startDate}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Number Of Travelers : ${trip.numberPerson}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Total Trip Price : ${trip.getTotalTripPrice()}\$",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          )),
      //test
      body: const ReviewOrgnizingTripBody(),
    );
  }
}



// AppBar(
//           actions: const [
//             CustomStepCircular(progress: 0.875, text: "3/8"),
//             SizedBox(width: 15)
//           ],
//           backgroundColor: Colors.white,
//           surfaceTintColor: Colors.white,
//           leading: const CustomBackButton(),
//         ),
////////////////////////////////////////////////////////////////////////
///Scaffold(
//   appBar: PreferredSize(
//     preferredSize: Size.fromHeight(120), // Set this height
//     child: Container(
//       color: Colors.orange,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('One'),
//           Text('Two'),
//           Text('Three'),
//           Text('Four'),
//         ],
//       ),
//     ),
//   ),
// )
////////////////////////////////////////////////////////////////////////
// Scaffold(
//   appBar: AppBar(
//     toolbarHeight: 120, // Set this height
//     flexibleSpace: Container(
//       color: Colors.orange,
//       child: Column(
//         children: [
//           Text('One'),
//           Text('Two'),
//           Text('Three'),
//           Text('Four'),
//         ],
//       ),
//     ),
//   ),
// )