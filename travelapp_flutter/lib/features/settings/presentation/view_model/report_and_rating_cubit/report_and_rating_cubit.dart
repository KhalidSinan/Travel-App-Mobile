import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/report_and_rating_cubit/report_and_rating_cubit_states.dart';

class ReportAndRatingCubit extends Cubit<ReportAndRatingStates> {
  ReportAndRatingCubit(this.settingsRepoImpl)
      : super(InitialReportAndRatingState());

  final SettingsRepoImpl settingsRepoImpl;

  Future<void> reportAnBug({
    required String tittle,
    required String bodyMessage,
  }) async {
    emit(LoadingReportABugState());

    await Future.delayed(const Duration(seconds: 1));

    var respons = await settingsRepoImpl.reportAnBug(
        body: {"report_title": tittle, "report_message": bodyMessage});

    respons.fold((failure) => emit(FailureReportABugState(failure: failure)),
        (res) {
      emit(SuccessReportABugState(successMessage: res["message"]));
    });
  }



  Future<void> ratingApp({
    required double rating,
    
  }) async {
    emit(LoadingRatingAppState());

    await Future.delayed(const Duration(seconds: 1));

    var respons = await settingsRepoImpl.ratingApp(
        body: {"rating": rating, });

    respons.fold((failure) => emit(FailureRatingAppState(failure: failure)),
        (res) {
      emit(SuccessRatingAppState(successMessage: res["message"]));
    });
  }
}
