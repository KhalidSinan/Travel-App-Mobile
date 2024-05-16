import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/form_cubit/form_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/form_card.dart';

class TileContent extends StatefulWidget {
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

  @override
  State<TileContent> createState() => _TileContentState();
}

class _TileContentState extends State<TileContent> {
  // final List<String> flightsId;
  @override
  Widget build(BuildContext context) {
    bool isForm = BlocProvider.of<FormCubit>(context).isForm;
    return BlocProvider.of<FormCubit>(context).passengers[widget.index] == null
        ? FormCard(
            index: widget.index,
            classType: widget.classType,
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
                    onPressed: () {
                      final formCubit = BlocProvider.of<FormCubit>(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: formCubit,
                            child: AlertDialog(
                              title: const Text('Warning !'),
                              content: const Text(
                                'Are you sure you want to delete this person',
                                style: TextStyle(fontSize: 18),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'back',
                                    style: TextStyle(
                                      color: Themes.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    if (isForm) {
                                      formCubit.removePassenger(widget.index);
                                    } else {
                                      await formCubit.cancleReservation(
                                        personId: formCubit
                                            .passengers[widget.index]!.id!,
                                        reserveId: formCubit.reservationId!,
                                        index: widget.index,
                                      );
                                    }
                                  },
                                  child: Text(
                                    'delete',
                                    style: TextStyle(
                                      color: Themes.third,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
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
