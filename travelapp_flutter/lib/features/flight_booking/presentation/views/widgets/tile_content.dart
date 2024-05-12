import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/form_cubit/form_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/form_card.dart';

class TileContent extends StatelessWidget {
  const TileContent({
    super.key,
    required this.index,
    required this.classType,
    // required this.flightsId,
    // required this.reservationType,
    // required this.seats,
  });
  final int index;
  final String classType;
  // final List<String> flightsId;
  // final String reservationType;
  // final int seats;

  @override
  Widget build(BuildContext context) {
    bool isForm = BlocProvider.of<FormCubit>(context).isForm;
    return BlocProvider.of<FormCubit>(context).passengers[index] == null
        ? FormCard(
            index: index,
            classType: classType,
          )
        : BlocBuilder<FormCubit, FormCubitState>(
            builder: (context, state) {
              if (state is DeleteLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () async {
                      final formCubit = BlocProvider.of<FormCubit>(context);
                      if (isForm) {
                        formCubit.removePassenger(index);
                      } else {
                        await formCubit.cancleReservation(
                          personId: formCubit.passengers[index]!.id!,
                          reserveId: formCubit.reservationId!,
                          index: index,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Themes.third,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
            },
          );
  }
}
