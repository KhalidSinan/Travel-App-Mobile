import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/date_picker.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
import 'package:intl/intl.dart';

class ClenderRow extends StatefulWidget {
  const ClenderRow({
    super.key,
    required this.text,
    required this.width,
    this.onSaved,
  });

  final String text;
  final double width;
  final void Function(String?)? onSaved;

  @override
  State<ClenderRow> createState() => ClenderRowState();
}

class ClenderRowState extends State<ClenderRow> {
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: CustomTextAndTextForm(
            text: widget.text,
            hintText: 'select date',
            width: widget.width,
            hight: 70,
            controller: date,
            onSaved: widget.onSaved,
            validator: validateName,
            prefixIcon: const Icon(
              Icons.calendar_today_rounded,
            ),
            onTap: () async {
              DateTime? pickeddate = await customDatePicker(context: context);

              if (pickeddate != null) {
                setState(() {
                  DateFormat outputFormat = DateFormat('dd/MM/yyyy');
                  date.text = outputFormat.format(pickeddate);
                });
              }
            }));
  }
}

















// Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(left: 10.0),
      //       child:
      //      *  Text(
      //         widget.text,
      //         style: const TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     SizedBox(
      //       * width: widget.width,
      //       height: 65,
      //       child:
      //        TextField(
      //        * controller: date,
      //          *readOnly: true,
      //        * decoration: const InputDecoration(
      //          * filled: true,
      //         *  fillColor: Color.fromARGB(255, 192, 218, 219),
      //        *   border: OutlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(32))),
      //           // icon: Icon(Icons.calendar_today_rounded),
      //         *  hintText: 'select date',
      //          *  prefixIcon: Icon(
      //             Icons.calendar_today_rounded,
      //           ),
      //           prefixIconColor: Color(0xff205E61),
      //         ),
      //      *   onTap: () async {
      //           DateTime? pickeddate = await showDatePicker(
      //               context: context,
      //               initialDate: DateTime.now(),
      //               firstDate: DateTime(2000),
      //               lastDate: DateTime(2100));

      //           if (pickeddate != null) {
      //             setState(() {
      //               date.text = pickeddate.toString();
      //             });
      //           }
      //         },
      //       ),
      //     ),
      //   ],
      // ),