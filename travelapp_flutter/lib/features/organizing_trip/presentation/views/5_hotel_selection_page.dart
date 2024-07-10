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
  const HotelSelectionPage({super.key, required this.bloc});

 final OrganizingTripCubit bloc;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: bloc,
        ),
        BlocProvider(
            create: (context) =>
                HotelInformationCubit(HotelformationInitialState()))
      ],
      child: Scaffold(
          appBar: AppBar(
            actions: const [
              CustomStepCircular(
                progress: 0.625,
                text: '5/8'
              ),
              SizedBox(width: 15)
            ],
            leading: const CustomBackButton(),
          ),
          body: const HotelSelectionBody()),
    );
  }
}
