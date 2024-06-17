import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_check_box.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/room_cart_card.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key, required this.bloc});
  final HotelDetailsCubit bloc;
  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  List<RoomCartModel> selectedRooms = [];
  bool selectAll = false;
  List<RoomCartModel> rooms = [];
  @override
  void initState() {
    rooms = widget.bloc.selectedRooms;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close_sharp),
                  onPressed: () => Get.back(),
                ),
                Text(
                  'Delete Room  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Themes.primary),
                ),
                const SizedBox(
                  width: 90,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectAll) {
                        selectedRooms.clear();
                      } else {
                        selectedRooms = List.from(rooms);
                      }
                      selectAll = !selectAll;
                    });
                  },
                  child: Text(
                    selectAll ? 'Deselect All' : 'Select All',
                    style: TextStyle(
                        color: Themes.third,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, int index) {
                    return CustomCheckBox(
                      listTileControlAffinity: ListTileControlAffinity.trailing,
                      title: RoomCartCard(
                        isNotDecreasable: true,
                        roomCart: rooms[index],
                      ),
                      value: selectedRooms.contains(rooms[index]),
                      onChanged: (value) {
                        if (value!) {
                          setState(() {
                            selectedRooms.add(rooms[index]);
                          });
                        } else {
                          setState(() {
                            selectedRooms.remove(rooms[index]);
                          });
                        }
                      },
                    );
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                label: 'Delete (${selectedRooms.length})',
                color: Colors.red,
                isFlat: true,
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Delete !',
                          ),
                          content: const Text(
                            'Are you sure to delete ?',
                            style: TextStyle(color: Colors.red),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'cancel',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (selectedRooms.isNotEmpty) {
                                  widget.bloc.removeRooms(selectedRooms);
                                  selectedRooms.clear();
                                  Navigator.pop(context);
                                  Get.back();
                                }
                              },
                              child: const Text(
                                'ok',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      });

                  //   }
                  // });
                }, //onpressed
              ),
            )
          ],
        ),
      )),
    );
  }
}
