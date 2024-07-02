import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/flight_details_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/flight_details_cubit.dart/flight_details_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/form_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/class_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/flight_details_card.dart';

// ignore: must_be_immutable
class FlightDetailsPage extends StatefulWidget {
  final String id;
  final String classType;
  String? idback;
  final int seats;
  bool? visible;
  FlightDetailsPage({
    super.key,
    required this.id,
    required this.classType,
    this.idback,
    required this.seats,
    this.visible,
  });

  @override
  State<FlightDetailsPage> createState() => _FlightDetailsPageState();
}

class _FlightDetailsPageState extends State<FlightDetailsPage> {
  final PageController controller = PageController();
  FlightDetailsModel? flightdetails;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightDetailsCubit(getIt.get<FlightBookingImp>())
        ..getFlightDetails(
          flightid: widget.id,
          classType: widget.classType,
          idback: widget.idback,
        ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<FlightDetailsCubit, FlightDetailsState>(
              listener: (context, state) {
                if (state is FlightDetailsFailure) {
                  Get.to(
                    () => FailurePage(
                      error: state.failure,
                      onPressed: () async {
                        await BlocProvider.of<FlightDetailsCubit>(context)
                            .getFlightDetails(
                          flightid: widget.id,
                          classType: widget.classType,
                          idback: widget.idback,
                        );
                      },
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is FlightDetailsSuccess) {
                  flightdetails = BlocProvider.of<FlightDetailsCubit>(context)
                      .flightdetails;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 460,
                          width: MediaQuery.of(context).size.width,
                          child: PageView(
                            controller: controller,
                            physics: const PageScrollPhysics(),
                            onPageChanged: (index) {
                              setState(() {});
                            },
                            children: [
                              FlightDetailsCard(
                                image: 'assets/images/path-go.png',
                                logo: flightdetails!.flight.airline.logo,
                                airline: flightdetails!.flight.airline.name,
                                source: flightdetails!.flight.source,
                                destination: flightdetails!.flight.destination,
                                srcairport: flightdetails!.flight.source.name,
                                desairport:
                                    flightdetails!.flight.destination.name,
                                departure: flightdetails!.flight.departure,
                                arrival: flightdetails!.flight.arrival,
                                duration: flightdetails!.flight.duration,
                                flightPrice:
                                    flightdetails!.flight.classType.price,
                              ),
                              if (flightdetails!.flightback != null)
                                FlightDetailsCard(
                                  image: 'assets/images/path-back.png',
                                  logo: flightdetails!.flightback!.airline.logo,
                                  airline:
                                      flightdetails!.flightback!.airline.name,
                                  source: flightdetails!.flightback!.source,
                                  destination:
                                      flightdetails!.flightback!.destination,
                                  srcairport:
                                      flightdetails!.flightback!.source.name,
                                  desairport: flightdetails!
                                      .flightback!.destination.name,
                                  departure:
                                      flightdetails!.flightback!.departure,
                                  arrival: flightdetails!.flightback!.arrival,
                                  duration: flightdetails!.flightback!.duration,
                                  flightPrice: flightdetails!
                                      .flightback!.classType.price,
                                ),
                            ],
                          ),
                        ),
                        flightdetails!.flightback != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: 2,
                                  effect: SwapEffect(
                                    dotWidth: 10,
                                    dotHeight: 10,
                                    activeDotColor: Themes.primary,
                                    type: SwapType.zRotation,
                                  ),
                                ),
                              )
                            : const Text(''),
                        ClassCard(
                          classType: flightdetails!.flight.classType.className,
                          load: flightdetails!.flight.classType.load,
                          features: flightdetails!.flight.classType.features,
                        ),
                        Visibility(
                          visible: widget.visible ?? true,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: CustomButton(
                                onPressed: () {
                                  List<String> flightsId = [
                                    flightdetails!.flight.id,
                                    flightdetails!.flightback?.id ?? '',
                                  ];
                                  flightsId
                                      .removeWhere((element) => element == '');
                                  Get.to(
                                    () => FormPage(
                                      flightsId: flightsId,
                                      reservationType: getReservationType(
                                          flightdetails!.twoWay),
                                      classType: flightdetails!
                                          .flight.classType.className,
                                      seats: widget.seats,
                                    ),
                                  );
                                },
                                label: 'Reserve',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Column(
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  String getReservationType(bool isTwoWay) {
    return isTwoWay ? 'Two-Way' : 'One-Way';
  }
}
