import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/FiltringPage/filtring_organized_body.dart';

class FilteringPage extends StatelessWidget {
  const FilteringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<OrganizedGroupCubit>(context),
    
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
          ),
          body: const Padding(
              padding: EdgeInsets.all(0.8), child: FiltringOrganizedBody()),
        ),
      ),
    );
  }
}



  // const Text(
  //           'Select Date Range:',
  //           style: TextStyle(
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         const SizedBox(height: 8.0),