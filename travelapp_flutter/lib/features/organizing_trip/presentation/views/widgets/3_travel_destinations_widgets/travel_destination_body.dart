import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/4_tickets_review_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/drop_selected_class.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/form_destinations.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/list_destination_view.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/source_form.dart';

class DestinationsSelectionBody extends StatefulWidget {
  const DestinationsSelectionBody({super.key});

  @override
  State<DestinationsSelectionBody> createState() =>
      _DestinationsSelectionBodyState();
}

class _DestinationsSelectionBodyState extends State<DestinationsSelectionBody> {
  TextEditingController searchcontroller2 = TextEditingController();
  TextEditingController searchcontroller3 = TextEditingController();
  bool value = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizingTripCubit, OrganizingTripStates>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Number Of Trip Days : ${BlocProvider.of<OrganizingTripCubit>(context).numberDays}',
                          style: Styles.heading2
                              .copyWith(color: Themes.third, fontSize: 25),
                        ),
                      ),
                      const SourceForm(),
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Class Type :',
                                style: TextStyle(fontSize: 25)),
                            SizedBox(width: 15),
                            Expanded(
                                child:
                                    SizedBox(child: DropSelectClassFlight())),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Destinations :',
                                style: TextStyle(fontSize: 25)),
                            const Spacer(),
                            const Text('Return Home',
                                style: TextStyle(fontSize: 15)),
                            Checkbox(
                              activeColor: Themes.primary,
                              value: value,
                              onChanged: (newvalue) {
                                setState(() {
                                  value = newvalue ?? false;
                                  BlocProvider.of<OrganizingTripCubit>(context)
                                      .setReturnHome(value);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      const FormDestinations(),
                      const ListDestinationView(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Visibility(
                  visible: BlocProvider.of<OrganizingTripCubit>(context)
                      .visibilityButton(),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.white.withOpacity(0.9),
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await BlocProvider.of<OrganizingTripCubit>(context)
                              .checkFlightsForTrip();
                          Get.to(const TicketsReviewPage());
                        }
                      },
                      label: "Check",
                      isFlat: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
