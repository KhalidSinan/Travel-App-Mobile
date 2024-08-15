import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/data/repos/organizer_report_repo_impl.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_review_cubit/organizer_review_states.dart';

class OrganizerReviewCubit extends Cubit<OrganizerReviewStates> {
  OrganizerReviewCubit(this.organizerReportRepoImpl, this.tripId)
      : super(InitialReviewState());

  final OrganizerReportRepoImpl organizerReportRepoImpl;
  final String tripId;
  int rating = 3;

  Future<void> reviewOrganizer() async {
    emit(LoadingReviewState());
    var response = await organizerReportRepoImpl.reviewOrganizer(
      tripId: tripId,
      rate: rating,
    );
    response.fold(
      (failure) {
        emit(FailureReviewState(failure: failure));
      },
      (res) {
        emit(SuccessReviewState());
      },
    );
  }

  void changeRating(int rating) {
    this.rating = rating;
    emit(ChangeRating());
  }

  String getRatingLabel() {
    switch (rating) {
      case 1:
        return 'Very Bad';
      case 2:
        return 'Bad';
      case 3:
        return 'Good';
      case 4:
        return 'Very Good';
      case 5:
        return 'Excellent';
      default:
        return '';
    }
  }
}
