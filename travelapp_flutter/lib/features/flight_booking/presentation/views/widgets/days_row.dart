import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/date_card.dart';

class DaysRow extends StatefulWidget {
  const DaysRow({
    super.key,
  });

  @override
  State<DaysRow> createState() => _DaysRowState();
}

class _DaysRowState extends State<DaysRow> {
  late DateTime currentDate;
  late List<DateTime> days;
  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    days = [
      currentDate.subtract(const Duration(days: 1)),
      currentDate,
      currentDate.add(const Duration(days: 1)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        days.length,
        (index) {
          return Expanded(
            flex: index == 1 ? 2 : 1,
            child: GestureDetector(
              onTap: () {
                if (index == 1) return;
                setState(() {
                  days = [
                    days[index].subtract(const Duration(days: 1)),
                    days[index],
                    days[index].add(const Duration(days: 1)),
                  ];
                });
              },
              child: DateCard(
                date: days[index],
                isCurrent: index == 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
