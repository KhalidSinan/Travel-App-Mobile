import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';

import 'package:travelapp_flutter/features/settings/presentation/view_model/delete_account_cubit/delete_account_cubit_states.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountStates> {
  DeleteAccountCubit(this.settingsRepoImpl) : super(InitialDeleteAccount());

  final SettingsRepoImpl settingsRepoImpl;

  Future<void> checkPassword({
    required String password,
  }) async {
    emit(LoadingCheckPassword());

    await Future.delayed(const Duration(seconds: 1));

    var respons = await settingsRepoImpl.checkPassword(body: {
      "password" : password
    });

    respons.fold((failure) => emit(FailureCheckPassword(failure: failure)),
        (res) {
      emit(SuccessCheckPassword());
    });
  }


  Future<void> deleteAccount({
    required String code,
  }) async {
    emit(LoadingDeleteAccount());

    await Future.delayed(const Duration(seconds: 1));

    var respons = await settingsRepoImpl.deleteAccount(
      
      body: {
      "token" : code
    } 
    
    );

    respons.fold((failure) => emit(FailureDeleteAccount(failure: failure)),
        (res) {
      emit(SuccessDeleteAccount(successMessage: res["message"]));
    });
  }
}
