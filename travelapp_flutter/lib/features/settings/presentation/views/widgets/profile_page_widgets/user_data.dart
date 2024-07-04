import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/settings_cubit/settings_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/location_cities.dart';

class UserData extends StatefulWidget {
  const UserData(
      {super.key, required this.icon, required this.text, this.edit});
  final IconData icon;
  final String text;
  final bool? edit;

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  List<dynamic>? countries;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, top: 25, right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 32,
                    color: Themes.primary,
                  ),
                  const SizedBox(width: 10),
                 Text(
                          widget.text,
                          style: const TextStyle(fontSize: 20),
                        ),
                ],
              ),
              if (widget.edit == true)
                GestureDetector(
                  onTap: () {
                    LocationCities(countries: BlocProvider.of<SettingsCubit>(context).cities);
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: Themes.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Divider(
          color: Themes.third,
          thickness: 2,
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }
}
