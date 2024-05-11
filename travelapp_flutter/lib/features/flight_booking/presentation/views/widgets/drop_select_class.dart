import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit.dart';
>>>>>>> Khalid

class DropSelectClass extends StatefulWidget {
  const DropSelectClass({super.key});

  @override
  State<DropSelectClass> createState() => _DropState();
}

class _DropState extends State<DropSelectClass> {
<<<<<<< HEAD
  String? selectedclass;
=======
  String? selectedClass;
>>>>>>> Khalid
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
<<<<<<< HEAD
                width: 170,
=======
>>>>>>> Khalid
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButtonFormField(
                    // hint: const Text('select class'),
<<<<<<< HEAD
                    items: ["First", "Economy", "Vip"]
=======
                    items: ["First", "Bussiness", "Economy"]
>>>>>>> Khalid
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    validator: (value) =>
                        value == null ? 'field required' : null,
                    onChanged: (val) {
                      setState(() {
<<<<<<< HEAD
                        selectedclass = val;
                        print(selectedclass);
                      });
                    },
                    value: selectedclass,
=======
                        selectedClass = val;
                        getget();
                      });
                    },

                    value: selectedClass,
>>>>>>> Khalid
                  ),
                ),
              ))
        ]));
  }
<<<<<<< HEAD
=======

  void getget() {
    BlocProvider.of<ReservationTicketCubit>(context)
        .getClass(selectedClass: selectedClass!);
  }
>>>>>>> Khalid
}
