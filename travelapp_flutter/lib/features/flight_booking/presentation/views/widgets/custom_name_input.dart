import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

// ignore: must_be_immutable
class CustomDataInput extends StatelessWidget {
  String? text;
  void Function(String?)? onSaved;
  final double width;
  // final bool readonly;
  TextInputType inputType;
  TextEditingController controller = TextEditingController();
  String? Function(String?)? validator;

  CustomDataInput({
    super.key,
    this.text,
    required this.width,
    // required this.readonly,
    required this.inputType,
    required this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            text ?? '',
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * width,
          height: 60,
          child: TextFormField(
            controller: controller,
            // readOnly: readonly,
            showCursor: true,
            cursorOpacityAnimates: true,
            cursorColor: Themes.primary,
            cursorHeight: 25,
            cursorRadius: const Radius.circular(5),
            keyboardType: inputType,
            validator: validator ?? validateName,
            onSaved: onSaved,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Themes.primary,
                  width: 2,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
