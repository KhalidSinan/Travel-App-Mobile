import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({super.key});

  @override
  State<CustomTableCalendar> createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  final CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOn; 
  final DateTime focusedDay = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: TableCalendar(
          calendarStyle: CalendarStyle(
            rangeEndDecoration: const BoxDecoration(
                color: Color(0xffffb156), shape: BoxShape.circle),
            rangeEndTextStyle: const TextStyle(color: Colors.black),
            rangeStartTextStyle: const TextStyle(color: Colors.black),
            rangeStartDecoration: const BoxDecoration(
                color: Color(0xffffb156), shape: BoxShape.circle),
            todayDecoration: BoxDecoration(
                color: const Color(0xffffb156).withOpacity(0.4),
                shape: BoxShape.circle),
            todayTextStyle: const TextStyle(color: Colors.black),
            rangeHighlightColor: const Color(0xff205E61).withOpacity(0.4),
            // selectedTextStyle: const TextStyle(color: Colors.amber),
            // selectedDecoration: const BoxDecoration(
            //     color: Color(0xff205E61), shape: BoxShape.circle),
            // defaultTextStyle: const TextStyle(color: Colors.red),
            // weekNumberTextStyle: const TextStyle(color: Colors.amber),
            // weekendTextStyle: const TextStyle(color: Colors.green),
          ),

          //-----------------------------------------------
          headerStyle: HeaderStyle(
              headerMargin: const EdgeInsets.only(bottom: 16),
              titleCentered: true,
              formatButtonVisible: false,
              rightChevronIcon: const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              leftChevronIcon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              decoration: BoxDecoration(
                  color: const Color(0xff205E61).withOpacity(0.8))),

          //--------------------------------
          daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  color: Color(0xff205E61), fontWeight: FontWeight.bold),
              weekendStyle: TextStyle(
                  color: Color(0xff205E61), fontWeight: FontWeight.bold)),
          //-------------------------------------
          firstDay: DateTime.utc(2010, 1, 1),
          lastDay: DateTime.utc(2035, 1, 1),
          focusedDay: focusedDay,
          rangeStartDay: rangeStart,
          rangeEndDay: rangeEnd,
          calendarFormat: calendarFormat,
          rangeSelectionMode: rangeSelectionMode,
          onRangeSelected: (start, end, focusedDay) {
            setState(() {
              // _selectedDay = _selectedDay;
              focusedDay = focusedDay;
              rangeStart = start;
              rangeEnd = start?.add(const Duration(days: 4));
              rangeSelectionMode = RangeSelectionMode.enforced;
            });
          },
          // onFormatChanged: (format) {
          //   if (_calendarFormat != format) {
          //     setState(() {
          //       _calendarFormat = format;
          //     });
          //   }
          // },
          // onPageChanged: (focusedDay) {
          //   _focusedDay = focusedDay;
          // },
          // selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          // onDaySelected: (selectedDay, focusedDay) {
          //   if (!isSameDay(_selectedDay, selectedDay)) {
          //     setState(() {
          //       _selectedDay = selectedDay;
          //       _focusedDay = focusedDay;
          //       rangeStart = null; // Important to clean those
          //       rangeEnd = null;
          //       _rangeSelectionMode = RangeSelectionMode.toggledOff;
          //     });
          //   }
          // },
        ),
      ),
    );
  }
}
