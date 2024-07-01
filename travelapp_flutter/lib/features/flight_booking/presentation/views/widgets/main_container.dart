import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/tab_bar_view.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/tabs.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return BlocProvider(
      create: (context) => ReservationTicketCubit(getIt.get<FlightBookingImp>())
        ..getCountriesAndAirlines(),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: BlocConsumer<ReservationTicketCubit, ReservationTicketState>(
            listener: (context, state) {
              if (state is FailureReservationTicketState) {
                Get.to(
                  () => FailurePage(
                    error: state.failure,
                    onPressed: () async {
                      await BlocProvider.of<ReservationTicketCubit>(context)
                          .getCountriesAndAirlines();
                    },
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingReservationTicketState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Tabs(tabController: tabController),
                    const SizedBox(
                      height: 15,
                    ),
                    TabbarView(tabController: tabController)
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
