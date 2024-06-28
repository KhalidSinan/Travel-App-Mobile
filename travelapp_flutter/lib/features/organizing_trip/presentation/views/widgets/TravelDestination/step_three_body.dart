import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/drop_select_class.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/form_destinations.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/list_destination_view.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/source_form.dart';

class StepThreeBody extends StatefulWidget {
  const StepThreeBody({super.key});

  @override
  State<StepThreeBody> createState() => _StepThreeBodyState();
}

class _StepThreeBodyState extends State<StepThreeBody> {
  TextEditingController searchcontroller2 = TextEditingController();
  TextEditingController searchcontroller3 = TextEditingController();
  bool value =false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizingTripCubit(getIt.get<OrganizingTripImpl>())
        ..getCountriesAndAirlines(),
      child: BlocConsumer<OrganizingTripCubit, OrganizingTripStates>(
        listener: (context, state) {
          if (state is FailureOrganizingTrip) {
            Get.to(() => FailurePage(
                  error: state.failure,
                  onPressed: () async {
                    await BlocProvider.of<OrganizingTripCubit>(context)
                        .getCountriesAndAirlines();
                  },
                ));
          }
        },
        builder: (context, state) {
          if (state is LoadingOrganizingTrip) {
            return const CircularProgressIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Number Of Trip Days : ${8}',
                        style: Styles.heading2
                            .copyWith(color: Themes.third, fontSize: 25),
                      ),
                    ),
                     SourceForm(),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Class Type :',
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(child: SizedBox(child: DropSelectClass())),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Destinations :',
                            style: TextStyle(fontSize: 25),
                          ),
                          const Spacer(),
                          const Text(
                            'Return Home',
                            style: TextStyle(fontSize: 15),
                          ),
                          Checkbox(
                              activeColor: Themes.primary,
                              value: value,
                              onChanged: (newvalue) {
                                setState(() {
                                  // print(value);
                                    value = newvalue ?? false;
                                });
                              })
                        ],
                      ),
                    ),
                    const FormDestinations(
                   
                    ),
                    const ListDestinationView(),
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: () {},
                      label: "Check",
                      isFlat: true,
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
