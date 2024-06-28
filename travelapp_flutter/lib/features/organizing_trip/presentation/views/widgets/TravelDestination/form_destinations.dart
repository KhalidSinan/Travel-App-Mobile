import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/custom_search_cities.dart';

class FormDestinations extends StatefulWidget {
  const FormDestinations({
    super.key,
  });

  @override
  State<FormDestinations> createState() => _FormDestinationsState();
}

class _FormDestinationsState extends State<FormDestinations> {
  TextEditingController searchcontroller1 = TextEditingController();
  TextEditingController searchcontroller2 = TextEditingController();
  String? src;
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
              onTap: () async {
                var searchResult = await showSearch(
                  context: context,
                  delegate: CustomSearchCities(
                    countries:
                        BlocProvider.of<OrganizingTripCubit>(context).cities,
                  ),
                );
                if (searchResult != null) {
                  setState(() {
                    searchcontroller1.text = searchResult.toString();
                  });
                }
              },
              controller: searchcontroller1,
              onSaved: (value) => src = value,
              validator: validateName,
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
                    controller: searchcontroller2,
                    onSaved: (value) => src = value,
                    validator: validateName,
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
