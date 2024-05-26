import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';

class SortHotelSheet extends StatefulWidget {
  const SortHotelSheet({super.key});

  @override
  State<SortHotelSheet> createState() => _SortHotelSheetState();
}

class _SortHotelSheetState extends State<SortHotelSheet> {
  List<String> sortBy = [
    'price_asc',
    'price_desc',
    'Least rated',
    'Most rated',
  ];
  List<String> titles = [
    ' Price Low to High',
    ' Price High to Low',
    ' Least rated',
    ' Most rated',
  ];
  String? currentSortBy;
  @override
  void initState() {
    super.initState();

    currentSortBy = BlocProvider.of<AllHotelsCubit>(context).order;
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
                'Sort By ',
                style: Styles.heading2,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                  BlocProvider.of<AllHotelsCubit>(context).applySorting(
                      sortField(order: "price"), order(order: "asc"));
                },
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
                  });
                });
          }),
          const Spacer(flex: 1),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {
                Get.back();
                BlocProvider.of<AllHotelsCubit>(context).applySorting(
                    sortField(order: currentSortBy!),
                    order(order: currentSortBy!));
              },
              label: 'Apply Sorting',
            ),
          ),
        ],
      ),
    );
  }
}

String sortField({required String order}) {
  switch (order) {
    case "price_asc":
    case "price_desc":
      return "price";

    case "Least rated":
    case "Most rated":
      return "stars";

    default:
      return "price";
  }
}

String order({required String order}) {
  switch (order) {
    case "price_asc":
      return "asc";
    case "price_desc":
      return "desc";

    case "Least rated":
      return "asc";
    case "Most rated":
      return "desc";

    default:
      return "asc";
  }
}
