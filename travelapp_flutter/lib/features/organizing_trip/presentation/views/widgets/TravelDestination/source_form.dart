import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';

class SourceForm extends StatelessWidget {
  const SourceForm({
    super.key,
    required this.searchcontroller1,
  });

  final TextEditingController searchcontroller1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Source',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: CustomTextFormField(
              outlineInputBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Themes.primary)),
              prefixIcon: const Icon(Icons.flight_takeoff_outlined),
              onTap: () {},
              controller: searchcontroller1,
              onSaved: (value) {},
              validator: (string) {},
            ),
          ),
        ],
      ),
    );
  }
}
