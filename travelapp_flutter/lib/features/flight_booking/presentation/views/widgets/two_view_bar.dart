import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/all_flights_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/clender_row.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_search.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/drop_select_class.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/number_of_passengers.dart';

class TwoViewBar extends StatefulWidget {
  const TwoViewBar({super.key});

  @override
  State<TwoViewBar> createState() => _TwoViewBarState();
}

class _TwoViewBarState extends State<TwoViewBar> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController searchcontroller1 = TextEditingController();
  TextEditingController searchcontroller2 = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? src, des, depart, retur, numOfPassengers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextAndTextForm(
                text: 'From',
                prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                hintText: 'Select Src',
                validator: validateName,
                onTap: searchFunction1,
                controller: searchcontroller1,
                onSaved: (value) => src = value,
              ),
              CustomTextAndTextForm(
                text: 'To',
                prefixIcon: const Icon(
                  Icons.flight_land_outlined,
                ),
                hintText: 'Select Des',
                validator: validateName,
                controller: searchcontroller2,
                onTap: searchFunction2,
                onSaved: (value) => des = value,
              ),
              Row(
                children: [
                  Expanded(
                    child: ClenderRow(
                      text: 'Depart',
                      width: 170,
                      onSaved: (value) => depart = value,
                    ),
                  ),
                  Expanded(
                    child: ClenderRow(
                      text: 'return',
                      width: 170,
                      onSaved: (value) => retur = value,
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: NumberOfPassengers(
                      onSaved: (value) => numOfPassengers = value,
                    ),
                  ),
                  const Expanded(
                    child: DropSelectClass(
                      text: 'class',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              BlocConsumer<ReservationTicketCubit, ReservationTicketState>(
                listener: (context, state) {
                  if (state is SuccessSearchFlightState) {
                    Get.to(
                      () => AllFlightsPage(
                        flights: state.flights,
                        isTwoWay: state.isTwoWay,
                        departureDate: state.departureDate,
                        source: state.source,
                        destination: state.destination,
                        seats: state.seats,
                        seatsClass: state.seatsClass,
                        dateEnd: state.dateEnd,
                        airlines: state.airlines,
                        totalFlights: state.totalFlights,
                      ),
                    );
                  } else if (state is FailureSearchFlightState) {
                    showCustomSnackBar(
                        title: 'Error', message: state.failure.errMessage);
                  }
                },
                builder: (context, state) {
                  return (state is LoadingSearchFlightState)
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: 350,
                          child: CustomButton(
                              onPressed: searchFlight, label: 'Search Flights'),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void searchFlight() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      String? seatClass =
          BlocProvider.of<ReservationTicketCubit>(context).seatClass;
      await BlocProvider.of<ReservationTicketCubit>(context).postSearchFlight(
          source: src!,
          destination: des!,
          date: depart!,
          dateEnd: retur!,
          twoWay: true,
          classOfSeats: seatClass!,
          numOfSeats: numOfPassengers!);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void searchFunction1() async {
    var searchResult = await showSearch(
        context: context,
        delegate: CustomSearch(
            countries:
                BlocProvider.of<ReservationTicketCubit>(context).countries,
            airLines:
                BlocProvider.of<ReservationTicketCubit>(context).airlines));
    if (searchResult != null) {
      setState(() {
        searchcontroller1.text = searchResult.toString();
      });
    }
  }

  void searchFunction2() async {
    var searchResult = await showSearch(
        context: context,
        delegate: CustomSearch(
            countries:
                BlocProvider.of<ReservationTicketCubit>(context).countries,
            airLines:
                BlocProvider.of<ReservationTicketCubit>(context).airlines));
    if (searchResult != null) {
      setState(() {
        searchcontroller2.text = searchResult.toString();
      });
    }
  }
}
