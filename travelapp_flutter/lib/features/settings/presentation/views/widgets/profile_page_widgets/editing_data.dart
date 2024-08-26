import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/core/helpers/date_picker.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/custom_search_cities.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/custom_country_codes.dart';

class EditingData extends StatefulWidget {
  const EditingData(
      {super.key, required this.type, this.text, required this.icon});
  final String? type, text;
  final IconData icon;
  @override
  State<EditingData> createState() => _EditingDataState();
}

class _EditingDataState extends State<EditingData> {
  TextEditingController searchcontroller1 = TextEditingController();
  TextEditingController searchcontroller2 = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 35,
              top: widget.type == 'number' ? 15 : 24,
              bottom: widget.type != 'number' ? 5 : 0,
              right: 35),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 32,
                color: Themes.primary,
              ),
              SizedBox(width: widget.type == 'number' ? 2 : 15),
              SizedBox(
                child: widget.type == 'number'
                    ? Row(
                        children: [
                          CustomCountryCodes(),
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              initialValue:
                                  BlocProvider.of<ProfilePageCubit>(context)
                                          .editNumber ??
                                      '',
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 2),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                BlocProvider.of<ProfilePageCubit>(context)
                                    .editNumber = value;
                              },
                              validator: validateNumber,
                            ),
                          ),
                        ],
                      )
                    : widget.type == 'location'
                        ? GestureDetector(
                            onTap: search,
                            child: Expanded(
                              child: Text(
                                '${BlocProvider.of<ProfilePageCubit>(context).editCity ?? 'City'}, ${BlocProvider.of<ProfilePageCubit>(context).editCountry ?? 'Country'}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          )
                        : widget.type == 'date'
                            ? GestureDetector(
                                onTap: () async {
                                  DateTime? pickeddate =
                                      await customDatePicker(context: context);
                                  if (pickeddate != null) {
                                    setState(() {
                                      DateFormat outputFormat =
                                          DateFormat('yyyy-MM-dd');
                                      datecontroller.text =
                                          outputFormat.format(pickeddate);

                                      BlocProvider.of<ProfilePageCubit>(context)
                                          .editDate = datecontroller.text;
                                    });
                                  }
                                },
                                child: Text(
                                  BlocProvider.of<ProfilePageCubit>(context)
                                          .editDate ??
                                      '2000-1-1',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              )
                            : widget.type == 'gender'
                                ? GestureDetector(
                                    onTap: () {
                                      if (BlocProvider.of<ProfilePageCubit>(
                                                  context)
                                              .editGender ==
                                          null) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                elevation: 0,
                                                shadowColor: Themes.primary,
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          BlocProvider.of<
                                                                      ProfilePageCubit>(
                                                                  context)
                                                              .editGender = 'Male';
                                                          // BlocProvider.of<
                                                          //             ProfilePageCubit>(
                                                          //         context)
                                                          //     .editState();
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            const MaterialStatePropertyAll(
                                                                Colors.white),
                                                        elevation:
                                                            const MaterialStatePropertyAll(
                                                                0),
                                                        overlayColor:
                                                            MaterialStatePropertyAll(
                                                          Themes.third
                                                              .withOpacity(0.1),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Male',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Themes.primary),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          BlocProvider.of<ProfilePageCubit>(
                                                                      context)
                                                                  .editGender =
                                                              'Female';
                                                          // BlocProvider.of<
                                                          //             ProfilePageCubit>(
                                                          //         context)
                                                          //     .editState();
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            const MaterialStatePropertyAll(
                                                                Colors.white),
                                                        elevation:
                                                            const MaterialStatePropertyAll(
                                                                0),
                                                        overlayColor:
                                                            MaterialStatePropertyAll(
                                                          Themes.third
                                                              .withOpacity(0.1),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'Female',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Themes.primary),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      } else {
                                        Get.snackbar(
                                          'Sorry !',
                                          "This field can't be edited",
                                          colorText: Themes.primary,
                                          titleText: const Text(
                                            'Sorry !',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          messageText: const Text(
                                            "This field can't be edited",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      }
                                    },
                                    child: Text(
                                      BlocProvider.of<ProfilePageCubit>(context)
                                              .editGender ??
                                          'Male/Female',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      Get.snackbar(
                                        'Sorry !',
                                        "This field can't be edited",
                                        colorText: Themes.primary,
                                        titleText: const Text(
                                          'Sorry !',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        messageText: const Text(
                                          "This field can't be edited",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    },
                                    child: Expanded(
                                      child: Text(
                                        widget.text!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
              ),
            ],
          ),
        ),
        SizedBox(height: widget.type == 'number' ? 4 : 8),
        Divider(
          color: Themes.third,
          thickness: 2,
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }

  void search() async {
    var searchResult = await showSearch(
      context: context,
      delegate: CustomSearchCities(
          countries: BlocProvider.of<ProfilePageCubit>(context).cities),
    );

    if (searchResult != null) {
      setState(() {
         searchcontroller1.text = searchResult['city'];
        searchcontroller2.text = searchResult['country'];
        BlocProvider.of<ProfilePageCubit>(context).editCity =
            searchcontroller1.text;
        BlocProvider.of<ProfilePageCubit>(context).editCountry =
            searchcontroller2.text;
      });
    }
  }
}
