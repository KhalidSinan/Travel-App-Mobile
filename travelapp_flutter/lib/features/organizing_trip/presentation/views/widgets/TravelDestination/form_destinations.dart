import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';

class FormDestinations extends StatelessWidget {
  const FormDestinations({
    super.key,
    required this.searchcontroller1,
    required this.searchcontroller2,
  });

  final TextEditingController searchcontroller1;
  final TextEditingController searchcontroller2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.sizeOf(context).width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          border: Border.all(color: Themes.primary, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextFormField(
              hintText: "Destination",
              outlineInputBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Themes.primary)),
              prefixIcon: const Icon(Icons.flight_takeoff_outlined),
              onTap: () {},
              controller: searchcontroller1,
              onSaved: (value) {},
              validator: (string) {},
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  child: CustomTextFormField(
                    hintText: "num Days",
                    textInputType: TextInputType.number,
                    outlineInputBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Themes.primary)),
                    onTap: () {},
                    controller: searchcontroller1,
                    onSaved: (value) {},
                    validator: (string) {},
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    label: "Save",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
