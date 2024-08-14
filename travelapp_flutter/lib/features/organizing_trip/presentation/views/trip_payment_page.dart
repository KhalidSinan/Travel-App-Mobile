import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/trip_payment_cubit/trip_payment_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/trip_payment_cubit/trip_payment_states.dart';

class TripPaymentPage extends StatelessWidget {
  const TripPaymentPage({
    super.key,
    required this.seats,
    required this.passengers,
    required this.trip,
  });
  final int seats;
  final List<PassengerModel?> passengers;
  final OrganizingTripCubit trip;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripPaymentCubit(
        seats: seats,
        trip: trip,
        passengers: passengers,
        organizingTripImpl: getIt.get<OrganizingTripImpl>(),
        flightBookingImp: getIt.get<FlightBookingImp>(),
        hotelBookingImp: getIt.get<HotelBookingImp>(),
      )..makeTrip(),
      child: const Scaffold(
        body: TripPaymentPageBody(),
      ),
    );
  }
}

class TripPaymentPageBody extends StatelessWidget {
  const TripPaymentPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: BlocConsumer<TripPaymentCubit, TripPaymentState>(
          listener: (context, state) {
            if (state is TripCreateSuccessState) {
              // Get.to(() => PayPal(
              //       url:
              //           '${getIt.get<ApiService>().baseUrl}/trips/${state.tripId}/pay',
              //       onSuccess: () {},
              //     ));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (state is TripCreateFailureState)
                      ? state.errMessage
                      : BlocProvider.of<TripPaymentCubit>(context).stepName,
                  style: Styles.heading.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 16),
                (state is TripCreateFailureState)
                    ? IconButton(
                        onPressed: () async {
                          await BlocProvider.of<TripPaymentCubit>(context)
                              .makeTrip();
                        },
                        icon: const Icon(Icons.restart_alt),
                      )
                    : LinearProgressIndicator(
                        value: BlocProvider.of<TripPaymentCubit>(context)
                            .stepValue,
                        color: Themes.third,
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
