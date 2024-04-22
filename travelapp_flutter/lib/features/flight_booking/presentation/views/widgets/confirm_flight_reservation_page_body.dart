import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/appbar_details_card.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/confirmation_step_buttons.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/details_header.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/passengers_list.dart';

class ConfirmFlightReservationPageBody extends StatelessWidget {
  const ConfirmFlightReservationPageBody({super.key});

  //final _scrollController = ScrollController();
  //final _scrollController = ScrollController();

  // bool _showButtons = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener((_scrollListener));
  // }

  // void _scrollListener() {
  //   if (_scrollController.position.userScrollDirection ==
  //           ScrollDirection.idle &&
  //       !_showButtons) {
  //     setState(() {
  //       _showButtons = true;
  //     });
  //   } else if (_scrollController.position.userScrollDirection !=
  //           ScrollDirection.idle &&
  //       _showButtons) {
  //     setState(() {
  //       _showButtons = false;
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //   _scrollController.removeListener((_scrollListener));
  //   _scrollController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomScrollView(
          slivers: [
            AppBarDetailsCard(),
            //DetailsHeader(),
            PassengersList(),
          ],
        ),
        //if (_showButtons)
        ConfirmationStepButtons()
      ],
    );
  }
}
