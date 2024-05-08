import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  late RangeValues prices;
  @override
  void initState() {
    super.initState();
    prices = BlocProvider.of<AllFlightsCubit>(context).prices;
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      prices.start.toInt().toString(),
      prices.end.toInt().toString(),
    );
    return Column(
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
          max: 3000,
          divisions: 30,
          activeColor: Colors.grey,
          onChanged: (newValue) {
            setState(() {
              prices = newValue;
              BlocProvider.of<AllFlightsCubit>(context).prices = prices;
            });
          },
        ),
      ],
    );
  }
}
