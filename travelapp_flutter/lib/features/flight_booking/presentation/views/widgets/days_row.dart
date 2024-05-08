import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/date_card.dart';
import 'package:intl/intl.dart';

import '../../view_model/all_flights_cubit/all_flights_cubit.dart';

class DaysRow extends StatelessWidget {
  const DaysRow({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFlightsCubit, AllFlightsStates>(
      builder: (context, state) {
        if (state is LoadingGetAllFlightsState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) {
                return Expanded(
                  flex: index == 1 ? 2 : 1,
                  child: Shimmer.fromColors(
                    period: const Duration(milliseconds: 2000),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Themes.secondary,
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SuccessGetAllFlightsState ||
            state is NoFlightsState) {
          DateTime currentDate = convertDateFormat(
              BlocProvider.of<AllFlightsCubit>(context).departureDate!);
          List<DateTime> days = [
            currentDate.subtract(const Duration(days: 1)),
            currentDate,
            currentDate.add(const Duration(days: 1)),
          ];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              days.length,
              (index) {
                return Expanded(
                  flex: index == 1 ? 2 : 1,
                  child: (index != 0 ||
                          (index == 0 && checkPreviousDayExist(days[1])))
                      ? GestureDetector(
                          onTap: () async {
                            if (index == 1) return;
                            DateFormat sendFormat = DateFormat('dd/MM/yyyy');
                            String sendDate = sendFormat.format(days[index]);
                            await getAllFlightsIn(context, sendDate);
                          },
                          child: DateCard(
                            date: days[index],
                            isCurrent: index == 1,
                          ),
                        )
                      : const SizedBox(),
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<void> getAllFlightsIn(context, sendDate) async {
    bool isTwoWay = BlocProvider.of<AllFlightsCubit>(context).isTwoWay;
    // here you've to restart the sorting and filtering things
    // or you should make a separate requets for switching dates.
    if (isTwoWay) {
      await BlocProvider.of<AllFlightsCubit>(context).getAllTwoWayFlights(
        source: 'Venezuela',
        destination: 'Russia',
        date: sendDate,
        seats: 1,
        seatsClass: 'A',
        dateEnd: '10/05/2024',
      );
    } else {
      await BlocProvider.of<AllFlightsCubit>(context).getAllOneWayFlights(
        source: 'United States',
        destination: 'Russia',
        date: sendDate,
        seats: 1,
        seatsClass: 'A',
      );
    }
  }

  DateTime convertDateFormat(String departureDate) {
    DateFormat inputFormat = DateFormat('dd/MM/yyyy');
    DateTime inputDate = inputFormat.parse(departureDate);
    DateFormat outpotFormat = DateFormat('yyyy-MM-dd');
    DateTime date = DateTime.parse(outpotFormat.format(inputDate));
    return date;
  }

  bool checkPreviousDayExist(DateTime currentDay) {
    DateTime today = DateTime.now();
    return !today.isAfter(currentDay);
  }
}
