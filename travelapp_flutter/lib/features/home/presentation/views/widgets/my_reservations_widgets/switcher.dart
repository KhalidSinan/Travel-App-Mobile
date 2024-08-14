import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_cubit.dart';

class Switcher extends StatefulWidget {
  const Switcher({super.key});
  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              'Current reservations',
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    BlocProvider.of<MyReservationsCubit>(context).switcher ==
                            false
                        ? FontWeight.bold
                        : null,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: BlocProvider.of<MyReservationsCubit>(context).switcher ==
                      false
                  ? Colors.black
                  : Colors.transparent,
              width: 160,
              height: 2,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: () {
              setState(() {
                if (BlocProvider.of<MyReservationsCubit>(context).switcher ==
                    true) {
                  BlocProvider.of<MyReservationsCubit>(context).switcher =
                      false;
                } else {
                  BlocProvider.of<MyReservationsCubit>(context).switcher = true;
                }
                BlocProvider.of<MyReservationsCubit>(context).switchState();
              });
            },
            icon: const Icon(
              FontAwesomeIcons.arrowRightArrowLeft,
            ),
            padding: const EdgeInsets.all(8),
            color: Themes.primary,
            highlightColor: Colors.grey[300],
          ),
        ),
        Column(
          children: [
            Text(
              'Lastest reservations',
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                    BlocProvider.of<MyReservationsCubit>(context).switcher ==
                            true
                        ? FontWeight.bold
                        : null,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color:
                  BlocProvider.of<MyReservationsCubit>(context).switcher == true
                      ? Colors.black
                      : Colors.transparent,
              width: 160,
              height: 2,
            )
          ],
        ),
      ],
    );
  }
}
