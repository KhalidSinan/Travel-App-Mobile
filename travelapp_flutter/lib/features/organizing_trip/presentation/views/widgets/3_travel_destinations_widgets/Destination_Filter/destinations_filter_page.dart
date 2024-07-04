import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/Destination_Filter/destination_filter_body.dart';

class DestinaionsFilterPage extends StatefulWidget {
  const DestinaionsFilterPage({super.key, required this.index});
  final int index;
  @override
  State<DestinaionsFilterPage> createState() => _DestinaionsFilterPageState();
}

class _DestinaionsFilterPageState extends State<DestinaionsFilterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizingTripCubit, OrganizingTripStates>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: const CustomBackButton(),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DestinationsFilterBody(index: widget.index),
            ),
          ),
        );
      },
    );
  }
}
