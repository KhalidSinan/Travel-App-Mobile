import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/places_widgets/places_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/schedule_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_cubit.dart';

class ContentOfStep extends StatelessWidget {
  const ContentOfStep({
    super.key,
    required this.i,
    required this.city,
    required this.step,
  });

  final int i;
  final String city;
  final int step;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleCubit, ScheduleStates>(
      builder: (context, state) => Column(
        children: [
          BlocProvider.of<ScheduleCubit>(context)
                  .tripSchedule[city]![step]['day${step + 1}']!
                  .isEmpty
              ? Text(
                  'Add Your Places !',
                  style: TextStyle(
                      color: Themes.third, fontWeight: FontWeight.bold),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: BlocProvider.of<ScheduleCubit>(context)
                      .tripSchedule[city]![step]['day${step + 1}']
                      ?.length,
                  itemBuilder: (context, i) {
                    return Row(
                      children: [
                        Expanded(
                          child: ScheduleCard(
                            place: BlocProvider.of<ScheduleCubit>(context)
                                    .tripSchedule[city]![step]
                                ['day${step + 1}']![i]!,
                          ),
                        ),
                        (BlocProvider.of<ScheduleCubit>(context).isEditable)
                            ? IconButton(
                                style: const ButtonStyle(
                                    iconColor:
                                        MaterialStatePropertyAll(Colors.red),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {
                                  BlocProvider.of<ScheduleCubit>(context)
                                      .deleteFromTripSchedule(city, step, i);
                                },
                                icon: const Icon(
                                  Icons.delete_forever,
                                  size: 28,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
          (BlocProvider.of<ScheduleCubit>(context).isEditable)
              ? IconButton(
                  style: ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Themes.primary),
                    backgroundColor: MaterialStatePropertyAll(Themes.secondary),
                  ),
                  onPressed: () {
                    Get.to(
                      () => PlacesPage(
                        city: city,
                        step: step,
                        schedule: BlocProvider.of<ScheduleCubit>(context),
                      ),
                    );
                  },
                  iconSize: 24,
                  icon: const Icon(Icons.add_location_alt_outlined))
              : const SizedBox(),
        ],
      ),
    );
  }
}
