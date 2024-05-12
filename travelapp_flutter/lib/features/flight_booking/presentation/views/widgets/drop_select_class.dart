import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit.dart';

class DropSelectClass extends StatefulWidget {
  const DropSelectClass({super.key});

  @override
  State<DropSelectClass> createState() => _DropState();
}

class _DropState extends State<DropSelectClass> {
  String? selectedClass;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'class',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(radius)),
              child: SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButtonFormField(
                    // hint: const Text('select class'),
                    items: ["First", "Bussiness", "Economy"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    validator: (value) =>
                        value == null ? 'field required' : null,
                    onChanged: (val) {
                      setState(() {
                        selectedClass = val;
                        getget();
                      });
                    },

                    value: selectedClass,
                  ),
                ),
              ))
        ]));
  }

  void getget() {
    BlocProvider.of<ReservationTicketCubit>(context)
        .getClass(selectedClass: selectedClass!);
  }
}
