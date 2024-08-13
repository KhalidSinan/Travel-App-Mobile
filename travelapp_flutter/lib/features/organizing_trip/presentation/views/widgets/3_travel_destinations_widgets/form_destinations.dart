import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_show_dialog.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/custom_search_cities.dart';

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
  int? numDays;
  final _formKey = GlobalKey<FormState>();
  List<DestinationsModel>? destinations;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.sizeOf(context).width,
        height: 215,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          border: Border.all(color: Themes.primary, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Form(
          key: _formKey,
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
                      searchcontroller1.text = searchResult['city'].toString();

                      BlocProvider.of<OrganizingTripCubit>(context)
                          .setDestinationCity(searchcontroller1.text);
                      BlocProvider.of<OrganizingTripCubit>(context)
                          .setDestinationCountry(searchResult['country']);
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
                      controller: searchcontroller2,
                      onChanged: (value) {
                        if (value != '') {
                          numDays = int.parse(value);
                          BlocProvider.of<OrganizingTripCubit>(context)
                              .setNumberOfDaysDes(numDays!);
                        }
                        print(numDays);
                      },
                      onSaved: (value) {
                        numDays = int.parse(value!);
                        BlocProvider.of<OrganizingTripCubit>(context)
                            .setNumberOfDaysDes(numDays!);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        } else if (value == '0') {
                          return ' zero is not valid';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          searchcontroller2.text = "";
                          searchcontroller1.text = "";
                          if (!BlocProvider.of<OrganizingTripCubit>(context)
                              .saveValidDestination(
                                  BlocProvider.of<OrganizingTripCubit>(context)
                                      .destinations,
                                  BlocProvider.of<OrganizingTripCubit>(context)
                                      .numberOfDaysDes)) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomShowDialog(
                                  title: Icon(
                                    FontAwesomeIcons.exclamation,
                                    size: 25,
                                    color: Themes.third,
                                    fill: 0.8,
                                  ),
                                  content: const Text(
                                    "Your Details Inppropriate",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  childTextButton: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "ok",
                                      style: TextStyle(
                                          fontSize: 16, color: Themes.primary),
                                    ),
                                  ),
                                );
                              },
                            );
                          }

                          BlocProvider.of<OrganizingTripCubit>(context)
                              .addDestination();
                        }
                      },
                      label: "Save",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
