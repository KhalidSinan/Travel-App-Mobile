import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/home_page_widgets/announcements_slider.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/home_page_widgets/flight_timer.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/home_page_widgets/my_history.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/home_page_widgets/nearby_places.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/home_page_widgets/reserve_buttons.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit_state.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key, required this.controller});
  final ScrollController controller;
  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfilePageCubit, ProfileStates>(
      listener: (context, state) async {
        if (state is ProfileSuccessState) {
          await getHomeData();
        }
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return Expanded(
              child: SingleChildScrollView(
                controller: widget.controller,
                child: Column(
                  children: [
                    AnnouncementsSlider(
                        isOrganizer: BlocProvider.of<ProfilePageCubit>(context)
                            .organizer!),
                    const SizedBox(height: 20),
                    const ReserveButtons(),
                    const FlightTimer(),
                    const SizedBox(height: 20),
                    const MyHistory(),
                    const SizedBox(height: 20),
                    const NearbyPlaces(),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const CustomLoading());
          }
        },
      ),
    );
  }

  Future<void> getHomeData() async {
    await BlocProvider.of<HomeCubit>(context).getHomeData();
  }

  Future<void> getUserData() async {
    await BlocProvider.of<ProfilePageCubit>(context).getUserData();
  }
}
