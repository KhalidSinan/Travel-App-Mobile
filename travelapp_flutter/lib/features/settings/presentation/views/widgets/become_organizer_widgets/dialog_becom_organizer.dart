import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';

Future<dynamic> dialogBecomeOrganizer(
    {required BuildContext context,
    required String title,
    required String content,
    required Color colorTitle,
    required IconData icon,
    required Color colorIcon,
    required Color colorLabel}) async {
  return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(color: colorTitle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: colorIcon,
                  size: 20,
                ),
              )
            ],
          ),
          content: Text(
            content,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                color: colorLabel,
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                label: 'ok',
              ),
            )
          ],
        );
      });
}
