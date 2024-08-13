import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/change_password_cubit/change_password_cubit_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit(this.settingsRepoImpl) : super(InitialChangePassword());

  final SettingsRepoImpl settingsRepoImpl;

  Future<void> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmationNewPassword}) async {
    emit(LoadingChangePassword());

    await Future.delayed(const Duration(seconds: 1));

    var respons = await settingsRepoImpl.changePassword(body: {
      "old_password": oldPassword,
      "new_password": newPassword,
      "new_password_confirmation": confirmationNewPassword,
    });

    respons.fold((failure) => emit(FailureChangePassword(failure: failure)),
        (res) {
      emit(SuccessChangePassword(successMessage: res['message']));
    });
  }
}
