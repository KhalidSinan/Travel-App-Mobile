// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/destination_filter_widgets/destination_filter_body.dart';

class DestinaionsFilterPage extends StatefulWidget {
  const DestinaionsFilterPage({
    super.key,
  });

  @override
  State<DestinaionsFilterPage> createState() => _DestinaionsFilterPageState();
}

class _DestinaionsFilterPageState extends State<DestinaionsFilterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: DestinationsFilterBody(),
        ),
      ),
    );
  }
}
