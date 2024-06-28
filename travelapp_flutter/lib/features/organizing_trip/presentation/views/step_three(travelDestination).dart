import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/step_three_body.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/custom_step_circular.dart';

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: const [
<<<<<<< HEAD
           
            CustomStepCircular(progress: 0.375),
=======
            // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Text(
            //     'Step 3/8',
            //     style: TextStyle(color: Themes.primary, fontSize: 22),
            //   ),
            // ),
            CustomStepCircular(progress: 0.375,text: '3/8',),
>>>>>>> 1e599dd71370d394be3541fb9d5bc6f3b84aea0f
            SizedBox(width: 15)
          ],
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: const CustomBackButton(),
        ),
        body: const StepThreeBody(),
      ),
    );
  }
}
