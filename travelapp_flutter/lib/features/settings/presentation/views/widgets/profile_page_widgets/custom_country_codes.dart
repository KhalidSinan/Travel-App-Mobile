// ignore_for_file: must_be_immutable

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';

class CustomCountryCodes extends StatelessWidget {
  CustomCountryCodes({super.key});
  CountryCode? initial;
  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      showFlagMain: false,
      padding: const EdgeInsets.all(0),
      textStyle: const TextStyle(fontSize: 20, color: Colors.black),
      flagWidth: 38,
      dialogSize: const Size.fromHeight(600),
      searchStyle: const TextStyle(fontSize: 16),
      dialogTextStyle: const TextStyle(fontSize: 16),
      searchDecoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Themes.primary))),
      boxDecoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      initialSelection: BlocProvider.of<ProfilePageCubit>(context).editCode != null ?
          '+${BlocProvider.of<ProfilePageCubit>(context).editCode}' : '+963',
      // onInit: (initial) {
      //   initial = CountryCode(
      //       dialCode:
      //           '+${BlocProvider.of<ProfilePageCubit>(context).editCode}');
      // },
      onChanged: (value) {
        BlocProvider.of<ProfilePageCubit>(context).editCode =
            value.toString().substring(1);
      },
    );
  }
}
