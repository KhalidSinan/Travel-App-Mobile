import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/email_confirm_cubit/email_confirm_states.dart';

class EmailConfirmCubit extends Cubit<EmailConfirmStates> {
  EmailConfirmCubit(this._authRepoImpl) : super(InitialEmailConfirmState());
  final AuthRepoImpl _authRepoImpl;

  Future<void> emailConfirm({
    required String email,
    required String code,
  }) async {
    emit(LoadingEmailConfirmState());
    var response = await _authRepoImpl.emailConfirm(
      email: email,
      code: code,
    );
    response.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureEmailConfirmState(errMessage: l.errMessage));
        }
      },
      (r) {
        emit(SuccessEmailConfirmState());
      },
    );
  }
}
