import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/core/helpers/date_picker.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';

class EditContainer extends StatefulWidget {
  const EditContainer({
    super.key,
    required this.toppositioned,
    required this.heightCard,
  });

  final double toppositioned;
  final double heightCard;

  @override
  State<EditContainer> createState() => _EditContainerState();
}

class _EditContainerState extends State<EditContainer> {
  TextEditingController dateController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  @override
  void initState() {
    //  اضافة القيم من واجهة سارة أي من الكيوبيت
    DateFormat startDateFormat = DateFormat('dd/MM/yyyy');
    String startDate = startDateFormat.format(DateTime.now());
    dateController.text =
        BlocProvider.of<HotelDetailsCubit>(context).startDate!.isEmpty
            ? startDate
            : BlocProvider.of<HotelDetailsCubit>(context).startDate!;
    daysController.text =
        BlocProvider.of<HotelDetailsCubit>(context).numDays ?? '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.toppositioned,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
            ),
          ],
        ),
        height: widget.heightCard,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Themes.third, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                CustomTextAndTextForm(
                  text: 'Date',
                  width: 300,
                  hight: 60,
                  outlineInputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.calendar_month),
                  controller: dateController,
                  onSaved: (val) {
                    BlocProvider.of<HotelDetailsCubit>(context).startDate = val;
                  },
                  onTap: () async {
                    DateTime? pickeddate =
                        await customDatePicker(context: context);

                    if (pickeddate != null) {
                      setState(() {
                        DateFormat outputFormat = DateFormat('dd/MM/yyyy');
                        dateController.text = outputFormat.format(pickeddate);
                        BlocProvider.of<HotelDetailsCubit>(context).startDate =
                            dateController.text;
                      });
                    }
                  },
                ),
                CustomTextAndTextForm(
                  text: 'Days',
                  width: 300,
                  hight: 60,
                  outlineInputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.view_day_outlined),
                  controller: daysController,
                  readOnly: false,
                  textInputType: TextInputType.number,
                  onSaved: (val) {
                    BlocProvider.of<HotelDetailsCubit>(context).numDays = val;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
