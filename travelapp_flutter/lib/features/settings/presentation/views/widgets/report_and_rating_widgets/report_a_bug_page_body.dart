import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/report_and_rating_cubit/report_and_rating_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/report_and_rating_cubit/report_and_rating_cubit_states.dart';

class ReportABugPageBody extends StatefulWidget {
  const ReportABugPageBody({super.key});

  @override
  State<ReportABugPageBody> createState() => _ReportABugPageBodyState();
}

class _ReportABugPageBodyState extends State<ReportABugPageBody> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? tittle;
  String? bodyMessage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Write your report on our app  ',
                  style: Styles.heading
                      .copyWith(color: Themes.third, fontSize: 20),
                ),
                Icon(
                  FontAwesomeIcons.faceSmileBeam,
                  color: Themes.primary,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.white,
                  border: Border.all(color: Themes.primary)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  children: [
                    CustomTextAndTextForm(
                      text: 'Tittle :',
                      hintText: 'enter the tittle',
                      hight: 90,
                      validator: validateName,
                      onSaved: (val) => tittle = val,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextAndTextForm(
                      text: 'Body : ',
                      hintText: 'enter the body ',
                      minLines: 1,
                      maxLines: 100,
                      hight: 200,
                      validator: validateName,
                      onSaved: (val) => bodyMessage = val,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocConsumer<ReportAndRatingCubit, ReportAndRatingStates>(
            listener: reportABugListener,
            builder: (context, state) {
              return (state is LoadingReportABugState)
                  ? const Center(child: CustomLoading())
                  : Center(
                      child: SizedBox(
                          width: 200,
                          child: CustomButton(
                              onPressed: sendReport, label: 'Send Report')));
            },
          )
        ])),
      ),
    );
  }

  void sendReport() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      await BlocProvider.of<ReportAndRatingCubit>(context)
          .reportAnBug(tittle: tittle!, bodyMessage: bodyMessage!);
    }
  }

  void reportABugListener(context, state) {
    if (state is FailureReportABugState) {
      showCustomSnackBar(title: 'Error', message: state.failure.errMessage);
    } else if (state is SuccessReportABugState) {
      Get.back();
      showCustomSnackBar(title: 'Success', message: state.successMessage);
    }
  }
}
