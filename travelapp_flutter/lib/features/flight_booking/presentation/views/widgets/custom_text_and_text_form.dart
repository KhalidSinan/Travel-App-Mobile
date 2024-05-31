import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';

class CustomTextAndTextForm extends StatefulWidget {
  const CustomTextAndTextForm(
      {super.key,
      this.hintText,
      this.validator,
      this.onChanged,
      this.obsecureText,
      this.textInputType,
      this.suffixIcon,
      this.onSaved,
      this.text,
      this.prefixIcon,
      this.readOnly,
      this.onTap,
      this.controller,
      this.width,
      this.labelText,
      this.hight, this.outlineInputBorder});
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
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
  State<CustomTextAndTextForm> createState() => _CustomTextAndTextFormState();
}

class _CustomTextAndTextFormState extends State<CustomTextAndTextForm> {
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
            child: CustomTextFormField(
              labeltext: widget.labelText,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              readOnly: widget.readOnly,
              onSaved: widget.onSaved,
              onChanged: widget.onChanged,
              textInputType: widget.textInputType,
              controller: widget.controller,
              validator: validateName,
              onTap: widget.onTap,
              outlineInputBorder: widget.outlineInputBorder,
            ),
          ),
        ],
      ),
    );
  }
}
