import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';

class PriceFilterTripGroup extends StatefulWidget {
  const PriceFilterTripGroup({super.key});

  @override
  State<PriceFilterTripGroup> createState() => _PriceFilterTripGroupState();
}

class _PriceFilterTripGroupState extends State<PriceFilterTripGroup> {
  late RangeValues prices;

  @override
  void initState() {
    super.initState();

    final cubit = BlocProvider.of<OrganizedGroupCubit>(context);
    prices = RangeValues(
      cubit.minPrice ?? 0,
      cubit.maxPrice ?? 10000,
    );
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      prices.start.toInt().toString(),
      prices.end.toInt().toString(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'By Price',
              style: Styles.heading2,
            ),
            const SizedBox(width: 16),
            Text(
              '(${prices.start.toInt()}\$ - ${prices.end.toInt()}\$)',
              style: Styles.content,
            ),
          ],
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: prices,
          labels: labels,
          min: 0,
          max: 10000,
          divisions: 100,
          activeColor: Colors.grey,
          onChanged: (newValue) {
            setState(() {
              prices = newValue;
            });

            BlocProvider.of<OrganizedGroupCubit>(context)
              ..minPrice = newValue.start
              ..maxPrice = newValue.end;
          },
        ),
      ],
    );
  }
}
