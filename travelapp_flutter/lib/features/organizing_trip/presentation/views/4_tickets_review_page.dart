// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/4_tickets_review_widgets/tickets_review_body.dart';

class TicketsReviewPage extends StatelessWidget {
  const TicketsReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CustomStepCircular(
            progress: 0.5,
            text: '4/8',
          ),
          SizedBox(width: 15)
        ],
        leading: CustomBackButton(
          onBack: BlocProvider.of<OrganizingTripCubit>(context).onPrevious,
        ),
      ),
      body: const SafeArea(
        child: TicketsReviewBody(),
      ),
    );
  }
}
