import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/report_and_rating_cubit/report_and_rating_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/report_and_rating_cubit/report_and_rating_cubit_states.dart';

class RatingAppSheet extends StatefulWidget {
  const RatingAppSheet({
    super.key,
  });

  @override
  State<RatingAppSheet> createState() => _RatingAppSheetState();
}

class _RatingAppSheetState extends State<RatingAppSheet> {
  double rating = 1;
  GlobalKey<FormState> passwordKey = GlobalKey();
  GlobalKey<FormState> codeKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text(
                          'Rating Our App :',
                          style: Styles.content.copyWith(color: Themes.primary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Text(
                        ' * you can only send rate every 15 days ',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RatingBar.builder(
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                    itemSize: 46,
                    glowColor: Colors.transparent,
                    minRating: 1,
                    initialRating: 1,
                    itemBuilder: (BuildContext context, int index) =>
                        const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {
                      setState(
                        () {
                          rating = value;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocConsumer<ReportAndRatingCubit, ReportAndRatingStates>(
                    listener: ratingAppListener,
                    builder: (context, state) {
                      return (state is LoadingRatingAppState)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              onPressed: () async {
                                await BlocProvider.of<ReportAndRatingCubit>(
                                        context)
                                    .ratingApp(rating: rating);
                              },
                              label: 'send rating ');
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }

  void ratingAppListener(context, state) {
    if (state is FailureRatingAppState) {
      Get.back();
      showCustomSnackBar(title: 'Please !', message: state.failure.errMessage);
    } else if (state is SuccessRatingAppState) {
      showCustomSnackBar(title: 'success', message: state.successMessage);
    }
  }
}
