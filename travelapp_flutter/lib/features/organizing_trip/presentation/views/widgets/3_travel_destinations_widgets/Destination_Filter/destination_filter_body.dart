import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
// import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/Destination_Filter/destination_airline_filter.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/Destination_Filter/destination_price_filter.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/Destination_Filter/destination_time_filter.dart';


class DestinationsFilterBody extends StatelessWidget {
  const DestinationsFilterBody({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          DestinationPriceFilter(
            index: index,
          ),
          const SizedBox(height: 64),
          DestinationAirlineFilter(index: index),
          const SizedBox(height: 64),
          DestinationTimeFilter(index: index),
          const SizedBox(height: 64),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {
                // BlocProvider.of<OrganizingTripCubit>(context)
                //     .printDestinationsList();
                Get.back();
              },
              label: 'Apply Filters',
            ),
          ),
        ],
      ),
    );
  }
}
