import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/core/helpers/date_picker.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class SearchFields extends StatefulWidget {
  const SearchFields({super.key});

  @override
  State<SearchFields> createState() => _SearchFieldsState();
}

class _SearchFieldsState extends State<SearchFields> {
  TextEditingController dateController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> key = GlobalKey();
  DateTime now = DateTime.now();
  String? name, days, rooms, date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: key,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              'Look for a hotel',
              style: Styles.heading2,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              textInputType: TextInputType.text,
              readOnly: false,
              controller: searchController,
              hintText: 'Search by a hotel name or a city',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              validator: validateName,
              onSaved: (value) {
                name = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Reservation date',
              prefixIcon: Icon(
                Icons.calendar_month,
                color: Colors.grey[600],
              ),
              controller: dateController,
              onSaved: (value) {
                date = value;
              },
              onTap: () async {
                DateTime? pickeddate = await customDatePicker(context: context);
                if (pickeddate != null) {
                  setState(
                    () {
                      DateFormat outputFormat = DateFormat('dd/MM/yyyy');
                      dateController.text = outputFormat.format(pickeddate);
                      BlocProvider.of<AllHotelsCubit>(context).startDate =
                          dateController.text;
                      //print(BlocProvider.of<AllHotelsCubit>(context).startDate);
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: CustomTextFormField(
                    textInputType: TextInputType.number,
                    hintText: 'Days',
                    prefixIcon: Icon(
                      Icons.view_day_outlined,
                      color: Colors.grey[600],
                    ),
                    onSaved: (value) {
                      days = value;
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: CustomTextFormField(
                    textInputType: TextInputType.number,
                    hintText: 'Rooms',
                    prefixIcon: Icon(
                      Icons.meeting_room,
                      color: Colors.grey[600],
                    ),
                    onSaved: (value) {
                      rooms = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            BlocBuilder<AllHotelsCubit, AllHotelStates>(
              builder: (context, state) {
                if (state is LoadingAllHotelStates) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      label: 'Search',
                      onPressed: searchHotels,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 38),
          ],
        ),
      ),
    );
  }

  void searchHotels() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      if (days!.isEmpty) days = '1';
      if (rooms!.isEmpty) rooms = '1';
      await BlocProvider.of<AllHotelsCubit>(context).getAllHotelData(
        nameHotelOrCity: name!,
        startDate: dateController.text,
        numDays: int.parse(days!),
        numRooms: int.parse(rooms!),
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
