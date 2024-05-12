import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';

class FailurePage extends StatelessWidget {
  const FailurePage({
    super.key,
    required this.error,
    required this.onPressed,
  });
  final Failure error;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff2f4f3),
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 20,
              color: Themes.primary,
            ),
          ),
        ),
        backgroundColor: const Color(0xfff2f4f3),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Themes.primary.withOpacity(0.7))),
                child: ClipRect(
                  child: Image.asset(
                    imageError(error: error),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  error.errMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Themes.primary),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width - 40,
                  child: CustomButton(onPressed: onPressed, label: "Restart")),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 40,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    side: BorderSide(color: Themes.primary),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: Themes.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String imageError({required Failure error}) {
  switch (error.errType) {
    case DioExceptionType.connectionError:
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return Assets.noInterent;
    default:
      return Assets.somethingWrong;
  }
}
