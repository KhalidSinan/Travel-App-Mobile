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
    'stars_asc',
    'stars_desc',
  ];
  List<String> titles = [
    ' Price Low to High',
    ' Price High to Low',
    ' Least rated',
    ' Most rated',
  ];
  String? currentorder;
  String? currentfield;
  String? currentSortBy;
  List<String>? splitValues;
  @override
  void initState() {
    super.initState();

    currentorder = BlocProvider.of<AllHotelsCubit>(context).order;
    currentfield = BlocProvider.of<AllHotelsCubit>(context).sortField;
    print(currentorder);
    print(currentfield);
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
                  BlocProvider.of<AllHotelsCubit>(context)
                      .applySorting(currentfield!, currentorder!);
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
            print(currentGroupValue(
                order: currentorder!, orderField: currentfield!));
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
                    if (value != null) {
                      splitValues = value.toString().split('_');
                      print(splitValues);
                      currentorder = splitValues![1].toString();
                      currentfield = splitValues![0].toString();
                      currentSortBy = "${currentfield}_$currentorder";
                      print(currentorder == splitValues![0]);
                      print(currentfield == splitValues![1]);
                      print(currentSortBy);
                    }
                  });
                });
          }),
          const Spacer(flex: 1),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {
                Get.back();
                print(currentorder);
                print(currentfield);
                BlocProvider.of<AllHotelsCubit>(context)
                    .applySorting(currentfield!, currentorder!);
              },
              label: 'Apply Sorting',
            ),
          ),
        ],
      ),
    );
  }
}

int currentGroupValue({required String order, required String orderField}) {
  switch ("$order-$orderField") {
    case "asc-price":
      return 0;
    case "desc-price":
      return 1;
    case "asc-stars":
      return 2;
    case "desc-stars":
      return 3;
    default:
      return 0;
  }
}
