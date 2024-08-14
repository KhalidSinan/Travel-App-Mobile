import 'package:get/get.dart';

void showCustomSnackBar({
  required String title,
  required String message,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,  
  );
}
