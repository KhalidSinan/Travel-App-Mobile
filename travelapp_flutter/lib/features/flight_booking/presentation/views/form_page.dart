import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/form_cubit/form_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/confirm_flight_reservation_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/plane_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/form_page_body.dart';

// ignore: must_be_immutable
class FormPage extends StatefulWidget {
  const FormPage({
    super.key,
    required this.seats,
    required this.classType,
    this.flightsId,
    this.reservationType,
    this.passengers,
    this.reservationId,
  });

  final List<String>? flightsId;
  final String? reservationType;
  final String classType;
  final int seats;
  final List<PassengerModel>? passengers;
  final String? reservationId;
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late int numberOfSeats = widget.seats;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(getIt.get<FlightBookingImp>())
        ..initialize(
          seats: widget.seats,
          passengers: widget.passengers,
          reservationId: widget.reservationId,
        ),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: SafeArea(
          child: BlocConsumer<FormCubit, FormCubitState>(
            listener: formListener,
            builder: (context, state) {
              if (state is FormLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return FormPageBody(
                  flightsId: widget.flightsId,
                  reservationType: widget.reservationType,
                  classType: widget.classType,
                  seats: numberOfSeats,
                  // isInitial: state is FormInitial,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void formListener(context, state) {
    if (state is PassengerDelete) {
      numberOfSeats--;
      if (numberOfSeats == 0) {
        bool isForm = BlocProvider.of<FormCubit>(context).isForm;
        if (isForm) {
          Get.back();
        } else {
          Get.offAll(() => const PlanePage());
        }
      }
    }
    if (state is FormSuccess) {
      // Get.to(() => PayPal(
      //       url:
      //           "http://10.0.2.2:5000/plane-reservations/${state.reservationId}/pay",
      //       onSuccess: () {
      //       },
      //     ));
      print(state.reservationId);
      Get.to(() => ConfirmFlightReservationPage(
            reservationId: state.reservationId,
          ));
    }
    if (state is FormFailure) {
      Get.to(() => FailurePage(
            error: state.failure,
            onPressed: () {
              BlocProvider.of<FormCubit>(context)
                  .initialize(seats: widget.seats);
            },
          ));
    }
    if (state is FormNotFilled) {
      showCustomSnackBar(
        title: 'Complete Form',
        message: 'All seats information must be entered',
      );
    }
    if (state is DeleteFailure) {
      showCustomSnackBar(
        title: 'Delete failed',
        message: state.failure.errMessage,
      );
    }
  }
}
