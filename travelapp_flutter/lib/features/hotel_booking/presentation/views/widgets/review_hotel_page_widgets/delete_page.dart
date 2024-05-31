import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_check_box.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/review_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/custom_card.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];
  List<String> selectedItems = [];
  bool selectAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(children: [
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
                    selectedItems.clear();
                  } else {
                    selectedItems = List.from(items);
                  }
                  selectAll = !selectAll;
                });
              },
              child: Text(
                selectAll ? 'Deselect All' : 'Select All',
                style: TextStyle(
                    color: Themes.third,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, int index) {
                  return CustomCheckBox(
                    listTileControlAffinity: ListTileControlAffinity.trailing,
                    title: const RoomCard2(),
                    value: selectedItems.contains(items[index]),
                    onChanged: (value) {
                      if (value!) {
                        setState(() {
                          selectedItems.add(items[index]);
                        });
                      } else {
                        setState(() {
                          selectedItems.remove(items[index]);
                        });
                      }
                    },
                  );
                }),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: 'Delete (${selectedItems.length})',
              color: Colors.red,
              isFlat: true,
              onPressed: () {
                // setState(() {
                //   if (selectedItems.isNotEmpty) {
                //     for (var item in selectedItems) {
                //       items.remove(item);
                //     }
                //     selectedItems.clear();
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
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (selectedItems.isNotEmpty) {
                                  for (var item in selectedItems) {
                                    items.remove(item);
                                  }
                                  selectedItems.clear();
                                  print(selectedItems);
                                  print('ss' '$items');
                                  Get.to(const ReviewPage());
                                }
                              });
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
    ));
  }
}

                      // AwesomeDialog(
                      //   context: context,
                      //   dismissOnTouchOutside: false,
                      //   dialogType: DialogType.success,
                      //   animType: AnimType.bottomSlide,
                      //   showCloseIcon: true,
                      //   title: 'succses',
                      //   desc: '',
                      //   btnOkOnPress: () => Get.to(const ReviewPage()),
                      // ).show();