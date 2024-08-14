import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/become_organizer_widgets/custom_text_filled_organizer.dart';

class CustomTextAndTextFilledOrganizer extends StatefulWidget {
  const CustomTextAndTextFilledOrganizer(
      {super.key,
      this.hintText,
      this.onChanged,
      this.obsecureText,
      this.textInputType,
      this.suffixIcon,
      this.text,
      this.prefixIcon,
      this.readOnly,
      this.onTap,
      this.controller,
      this.width,
      this.labelText,
      this.hight, this.outlineInputBorder});
  final String? hintText;
  final void Function(String)? onChanged;
  final bool? obsecureText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final String? text;
  final Widget? prefixIcon;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final double? width;
  final double? hight;
  final OutlineInputBorder? outlineInputBorder;
  final String? labelText;

  @override
  State<CustomTextAndTextFilledOrganizer> createState() => _CustomTextAndTextFilledOrganizerState();
}

class _CustomTextAndTextFilledOrganizerState extends State<CustomTextAndTextFilledOrganizer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 5),
            child: Text(
              widget.text!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: widget.width,
            height: widget.hight ?? 60,
            child: CustomTextFilledOrganizer(
              labeltext: widget.labelText,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              readOnly: widget.readOnly,
              onChanged: widget.onChanged,
              textInputType: widget.textInputType,
              controller: widget.controller,
              onTap: widget.onTap,
              outlineInputBorder: widget.outlineInputBorder,
            ),
          ),
        ],
      ),
    );
  }
}
