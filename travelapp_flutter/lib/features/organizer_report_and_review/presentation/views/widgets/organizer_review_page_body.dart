import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_review_cubit/organizer_review_cubit.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_review_cubit/organizer_review_states.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/success_page.dart';

class OrganizerReviewPageBody extends StatelessWidget {
  const OrganizerReviewPageBody({
    super.key,
    required this.organizerName,
  });

  final String organizerName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(24),
      child: BlocConsumer<OrganizerReviewCubit, OrganizerReviewStates>(
        listener: (context, state) {
          if (state is SuccessReviewState) {
            Get.off(() => const SuccessPage(
                  title: 'Thank You!',
                  content:
                      'Your review have been sent successfully, thanks for the review',
                ));
          } else if (state is FailureReviewState) {
            showCustomSnackBar(
              title: 'Review Failed',
              message: state.failure.errMessage.toString(),
            );
          }
        },
        builder: (context, state) => Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enjoyed the trip?",
                style: Styles.heading,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How good was $organizerName of the trip?",
                style: Styles.content.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 32),
            RatingBar.builder(
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemSize: 46,
              glowColor: Colors.transparent,
              minRating: 1,
              initialRating: 3,
              itemBuilder: (BuildContext context, int index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (double value) {
                BlocProvider.of<OrganizerReviewCubit>(context)
                    .changeRating(value.toInt());
              },
            ),
            const SizedBox(height: 24),
            Text(
              BlocProvider.of<OrganizerReviewCubit>(context).getRatingLabel(),
              style: Styles.content.copyWith(fontSize: 24),
            ),
            const Spacer(),
            (state is LoadingReviewState)
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: () async {
                        await BlocProvider.of<OrganizerReviewCubit>(context)
                            .reviewOrganizer();
                      },
                      label: 'Rate',
                    ),
                  ),
          ],
        ),
      ),
    ));
  }
}
