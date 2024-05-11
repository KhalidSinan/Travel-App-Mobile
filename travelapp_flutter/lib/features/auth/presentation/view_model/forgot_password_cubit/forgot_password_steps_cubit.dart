import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_steps_states.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStepsState> {
  ForgotPasswordCubit(this._authRepoImpl) : super(InitialStepState());
  final AuthRepoImpl _authRepoImpl;

  Future<void> forgotPassword({required String email}) async {
    emit(LoadingStepState());
    var response = await _authRepoImpl.fogotPassword(email: email);
    response.fold(
      (failure) {
        emit(FailureStepState(failure: failure));
      },
      (r) {
        emit(SuccessStepState());
      },
    );
  }

  Future<void> resetPassword({
    required String newPassword,
    required String newPasswordConfirm,
    required String code,
    required String email,
  }) async {
    emit(LoadingStepState());
    var response = await _authRepoImpl.resetPassword(
      newPassword: newPassword,
      newPasswordConfirm: newPasswordConfirm,
      code: code,
      email: email,
    );
    response.fold(
      (failure) {
        emit(FailureStepState(failure: failure));
      },
      (res) {
        emit(FinalStepState(message: res['message']));
      },
    );
  }
}
