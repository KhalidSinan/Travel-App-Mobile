import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/become_organizer_cubit/become_organizer_cubit_state.dart';

import 'package:dio/dio.dart';

class BecomeOrganizerCubit extends Cubit<BecomeOrganizerStates> {
  BecomeOrganizerCubit(this.settingsRepoImpl)
      : super(BecomeOrganizerInitialState());

  final SettingsRepoImpl settingsRepoImpl;
  String? messageSuccess;

  Future<void> becomOrganizer(
      {required String companyName,
      required String yearsOfExperience,
      required List<String> companiesWorkedFor,
      required File personalPicture,
      required File personalId,
      required File workId,
      required File lastCertificate}) async {
    emit(BecomeOrganizerLoadingState());

    await Future.delayed(const Duration(seconds: 1));

    var respons = await settingsRepoImpl.becomeOrganizer(
      body: FormData.fromMap(
        {
          "company_name": companyName,
          "years_of_experience": yearsOfExperience,
          "personal_picture": await MultipartFile.fromFile(
            personalPicture.path,
            filename: personalPicture.path.split('/').last,
          ),
          "personal_id": await MultipartFile.fromFile(
            personalId.path,
            filename: personalId.path.split('/').last,
          ),
          "work_id": await MultipartFile.fromFile(
            workId.path,
            filename: workId.path.split('/').last,
          ),
          "last_certificate": await MultipartFile.fromFile(
            lastCertificate.path,
            filename: lastCertificate.path.split('/').last,
          ),
          "companies_worked_for": companiesWorkedFor
        },
      ),
    );

    respons
        .fold((failure) => emit(BecomeOrganizerFailureState(failure: failure)),
            (res) {
      messageSuccess = res['message'];
      print('ssssss$messageSuccess ssssssss');
      emit(BecomeOrganizerSuccessState(successMessage: res['message']));
    });
  }
}
