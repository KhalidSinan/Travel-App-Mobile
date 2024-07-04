import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';

class DropSelectClassFlight extends StatefulWidget {
  const DropSelectClassFlight({super.key});

  @override
  State<DropSelectClassFlight> createState() => _DropState();
}

class _DropState extends State<DropSelectClassFlight> {
  String? selectedClass;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Themes.primary),
                borderRadius: BorderRadius.circular(radius)),
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonFormField(
                  items: ["First", "Business", "Economy"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  validator: (value) => value == null ? 'field required' : null,
                  onChanged: (value) {
                    setState(
                      () {
                        selectedClass = value;
                        print(value);
                        print("bbbbbbbbbbbbbbbbb");
                        print(selectedClass);
                        if (value != null) {
                          BlocProvider.of<OrganizingTripCubit>(context)
                              .setClassType(value);

                          debugPrint(
                              BlocProvider.of<OrganizingTripCubit>(context)
                                  .classType);
                          // debugPrint(
                          //     BlocProvider.of<OrganizingTripCubit>(context)
                          //         .source);
                        }
                      },
                    );
                  },
                  value: selectedClass,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
