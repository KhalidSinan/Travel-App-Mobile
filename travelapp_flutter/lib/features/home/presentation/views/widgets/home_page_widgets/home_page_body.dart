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
    getHomeData();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return Expanded(
            child: SingleChildScrollView(
              controller: widget.controller,
              child: const Column(
                children: [
                  AnnouncementsSlider(),
                  SizedBox(height: 20),
                  ReserveButtons(),
                  SizedBox(height: 10),
                  FlightTimer(),
                  SizedBox(height: 20),
                  MyHistory(),
                  SizedBox(height: 20),
                  NearbyPlaces(),
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
    );
  }

  Future<void> getHomeData() async {
    await BlocProvider.of<HomeCubit>(context).getHomeData();
  }

  Future<void> getUserData() async {
    await BlocProvider.of<ProfilePageCubit>(context).getUserData();
  }
}
