import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
//import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/editing_data.dart';

class UserData extends StatefulWidget {
  const UserData({
    super.key,
    required this.icon,
    required this.text,
    required this.type,
  });
  final IconData icon;
  final String? text;
  final String type;

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
          padding:
              const EdgeInsets.only(left: 35, top: 24, right: 35, bottom: 4),
          child: Row(
            children: [
              Icon(
                widget.text == null ||
                        widget.text == 'null, null' ||
                        widget.text == '+963  null'
                    ? Icons.question_mark_outlined
                    : widget.icon,
                size: 32,
                color: Themes.primary,
              ),
              const SizedBox(width: 15),
              Text(
                widget.type == 'gender' && widget.text == null
                    ? 'Define your gender'
                    : widget.type == 'date' && widget.text == null
                        ? 'Select your birth date'
                        : widget.type == 'number' &&
                                widget.text == '+963  null'
                            ? 'Add your number'
                            : widget.type == 'location' &&
                                    widget.text == 'null, null'
                                ? 'Add your location'
                                : widget.text!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20,
                    color: widget.text == null ||
                            widget.text == 'null, null' ||
                            widget.text == '+963  null'
                        ? Colors.grey
                        : Colors.black),
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
