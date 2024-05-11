import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';

class SortSheet extends StatefulWidget {
  const SortSheet({super.key});

  @override
  State<SortSheet> createState() => _SortSheetState();
}

class _SortSheetState extends State<SortSheet> {
  List<String> sortBy = [
    'time_asc',
    'time_desc',
    'price_asc',
    'price_desc',
  ];
  List<String> titles = [
    'Time: Close to Far',
    'Time: Far to Close',
    'Price: Low to High',
    'Price: High to Low',
  ];
  String? currentSortBy;
  @override
  void initState() {
    super.initState();
    currentSortBy = BlocProvider.of<AllFlightsCubit>(context).sortBy;
  }

  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Sort By',
                style: Styles.heading2,
              ),
              IconButton(
                onPressed: restartSorting,
                icon: const Icon(
                  FontAwesomeIcons.repeat,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          ...List.generate(sortBy.length, (index) {
            return RadioListTile(
                title: Text(
                  titles[index],
                  style: Styles.content.copyWith(color: Colors.grey),
                ),
                selected: currentSortBy == sortBy[index],
                activeColor: Themes.third,
                value: sortBy[index],
                groupValue: currentSortBy,
                onChanged: (value) {
                  setState(() {
                    currentSortBy = value.toString();
                    BlocProvider.of<AllFlightsCubit>(context).sortBy =
                        currentSortBy;
                  });
                });
          }),
          const Spacer(flex: 1),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: applySorting,
              label: 'Apply Sorting',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> applySorting() async {
    Get.back();
    await BlocProvider.of<AllFlightsCubit>(context).applySorting();
  }

  void restartSorting() {
    currentSortBy = null;
    BlocProvider.of<AllFlightsCubit>(context).sortBy = null;
    setState(() {});
  }
}
