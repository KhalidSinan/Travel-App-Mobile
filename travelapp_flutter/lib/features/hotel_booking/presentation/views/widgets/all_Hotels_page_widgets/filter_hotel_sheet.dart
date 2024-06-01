import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';

class FilterHotelSheet extends StatefulWidget {
  const FilterHotelSheet({
    super.key,
  });

  @override
  State<FilterHotelSheet> createState() => _FilterHotelSheetState();
}

@override
class _FilterHotelSheetState extends State<FilterHotelSheet> {
  double? stars;
  void initState() {
    super.initState();

    stars = BlocProvider.of<AllHotelsCubit>(context).stars;
    print(stars);
  }

  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: 250,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Filter By Stars',
                style: Styles.heading2,
              ),
              IconButton(
                onPressed: () {
                  rating = 0;
                  BlocProvider.of<AllHotelsCubit>(context)
                      .applyFilteringStars(0); //  question remember
                },
                icon: const Icon(
                  FontAwesomeIcons.repeat,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: RatingBar.builder(
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemSize: 46,
              glowColor: Colors.transparent,
              minRating: stars!,
              initialRating: stars!,
              itemBuilder: (BuildContext context, int index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (double value) {
                setState(
                  () {
                    rating = value;
                  },
                );
              },
            ),
          ),
          const Spacer(flex: 1),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () async {
                Get.back();
                await BlocProvider.of<AllHotelsCubit>(context)
                    .applyFilteringStars(rating);
              },
              label: 'Apply Filtering',
            ),
          ),
        ],
      ),
    );
  }
}
