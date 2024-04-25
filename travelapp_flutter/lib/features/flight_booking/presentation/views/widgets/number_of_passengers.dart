import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';

class NumberOfPassengers extends StatelessWidget {
  const NumberOfPassengers({
    super.key,
    this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: CustomTextAndTextForm(
          hintText: 'number ?',
          text: 'passengers',
          width: 170,
          readOnly: false,
          validator: validateName,
          textInputType: TextInputType.number,
          prefixIcon: Icon(Icons.person),
        ));
  }
}
