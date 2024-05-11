<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit_states.dart';
>>>>>>> Khalid
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/Tabbar_view.dart';
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

<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.only(top: 280),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: Column(
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
=======
    return BlocProvider(
      create: (context) => ReservationTicketCubit(getIt.get<FlightBookingImp>())
        ..getCountriesAndAirlines(),
      child: Padding(
        padding: const EdgeInsets.only(top: 230),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          child: BlocBuilder<ReservationTicketCubit, ReservationTicketState>(
            builder: (context, state) {
              if (state is LoadingReservationTicketState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FailureReservationTicketState) {
                return FailurePage(
                  error: state.failure,
                  onPressed: () async {
                    await BlocProvider.of<ReservationTicketCubit>(context)
                        .getCountriesAndAirlines();
                  },
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
>>>>>>> Khalid
        ),
      ),
    );
  }
}
<<<<<<< HEAD












  // Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 30),
  //                       child: Column(
  //                         children: [
  //                           const Padding(
  //                             padding: EdgeInsets.symmetric(horizontal: 10.0),
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [Text('From'), Text("To")],
  //                             ),
  //                           ),
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               Card(
  //                                   shape: RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(12)),
  //                                   elevation: 5,
  //                                   child: Container(
  //                                     width: 130,
  //                                     height: 40,
  //                                     decoration: BoxDecoration(
  //                                         color: Colors.black.withOpacity(0.1),
  //                                         borderRadius:
  //                                             BorderRadius.circular(12)),
  //                                     child: const Center(child: Text("ssss")),
  //                                   )),
  //                               IconButton(
  //                                   onPressed: () {},
  //                                   icon: const Icon(
  //                                     Icons.compare_arrows_sharp,
  //                                     size: 40,
  //                                   )),
  //                               Card(
  //                                   shape: RoundedRectangleBorder(
  //                                       borderRadius:
  //                                           BorderRadius.circular(12)),
  //                                   elevation: 5,
  //                                   child: Container(
  //                                     width: 130,
  //                                     height: 40,
  //                                     decoration: BoxDecoration(
  //                                         color: Colors.black.withOpacity(0.1),
  //                                         borderRadius:
  //                                             BorderRadius.circular(12)),
  //                                     child: const Center(child: Text("ssss")),
  //                                   )),
  //                             ],
  //                           )
  //                         ],
  //                       ),
  //                     ),
=======
>>>>>>> Khalid
