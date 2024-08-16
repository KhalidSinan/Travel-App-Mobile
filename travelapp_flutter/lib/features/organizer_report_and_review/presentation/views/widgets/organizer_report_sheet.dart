import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/data/models/organizer_model.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_report_cubit/organizer_report_cubit.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_report_cubit/organizer_report_states.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/success_page.dart';

class OrganzierReportSheet extends StatefulWidget {
  const OrganzierReportSheet({
    super.key,
    required this.organizer,
  });
  final OrganizerModel organizer;

  @override
  State<OrganzierReportSheet> createState() => _OrganzierReportSheetState();
}

class _OrganzierReportSheetState extends State<OrganzierReportSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, message;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrganizerReportCubit, OrganizerReportStates>(
      listener: (context, state) {
        if (state is FailureOrganizerReportState) {
          showCustomSnackBar(
            title: 'Send Report Failed',
            message: state.failure.errMessage.toString(),
          );
        }
        if (state is SuccessOrganizerReportState) {
          Get.off(
            () => const SuccessPage(
              title: 'Congrats!',
              content:
                  'Your report request have been sent successfully, we will check it as soon as possible',
            ),
          );

          Get.back();
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: CustomSheet(
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: ListView(
                children: [
                  Text(
                    'Report ${widget.organizer.name}',
                    style: Styles.heading2.copyWith(fontSize: 24),
                  ),
                  const Text(
                    'Please fill below fields to send the report, and journeyjoy\'s team will respond to your report as soon as possible.',
                    style: Styles.subtitle,
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    hintText: 'Report title',
                    validator: validateName,
                    onChanged: (newTitle) => title = newTitle,
                    onSaved: (newTitle) => title = newTitle,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'Report Message',
                    validator: validateName,
                    maxLines: 3,
                    onChanged: (newMessage) => message = newMessage,
                    onSaved: (newMessage) => message = newMessage,
                  ),
                  const SizedBox(height: 32),
                  (state is LoadingOrganizerReportState)
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            onPressed: sendReport,
                            label: 'Send Report',
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> sendReport() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await BlocProvider.of<OrganizerReportCubit>(context).reportOrganizer(
        organizerId: widget.organizer.id,
        title: title!,
        message: message!,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
