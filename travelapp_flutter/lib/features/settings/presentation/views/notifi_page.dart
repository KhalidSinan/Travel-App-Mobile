import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/notifi_cubit/notifi_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/notifi_cubit/notifi_cubit_states.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/notifi_page_widgets/notifi_page_body.dart';

class NotifiPage extends StatefulWidget {
  const NotifiPage({super.key, required this.controller, });
  final ScrollController controller;
  @override
  State<NotifiPage> createState() => _NotifiPageState();
}

class _NotifiPageState extends State<NotifiPage> {
  List<String> days = [
    "Today",
    "Yesterday",
    "Week",
    "Month",
    "Year",
    "MoreThanYear"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Notifications', style: Styles.heading2),),
      body: BlocConsumer<NotifiPageCubit, NotifiStates>(
          listener: (context, state) {
        if (state is NotifiFailureState) {
          showCustomSnackBar(title: 'Error', message: state.failure.errMessage);
        }
      }, builder: (context, state) {
        if (state is NotifiSuccessState) {
          return SafeArea(
            child: NotifiPagebody(
              days: days,
              allNotifications: state.allNotifiModel, controller: widget.controller,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
