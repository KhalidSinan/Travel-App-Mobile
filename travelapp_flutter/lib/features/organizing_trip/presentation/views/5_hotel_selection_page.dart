// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotel_selection_body.dart';

class HotelSelectionPage extends StatelessWidget {
  const HotelSelectionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HotelInformationCubit(
                  HotelformationInitialState(),
                  destinations: BlocProvider.of<OrganizingTripCubit>(context)
                      .destinations
                      .length,
                )..initialize())
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            CustomStepCircular(progress: 0.625, text: '5/8'),
            SizedBox(width: 15)
          ],
          leading: CustomBackButton(
            onBack: BlocProvider.of<OrganizingTripCubit>(context).onPrevious,
          ),
        ),
        body: const HotelSelectionBody(),
      ),
    );
  }
}
