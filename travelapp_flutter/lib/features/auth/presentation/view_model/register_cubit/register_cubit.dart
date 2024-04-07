import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/register_cubit/register_states.dart';

class RegisterCubit extends Cubit<RegistersStates> {
  RegisterCubit(this._authRepoImpl) : super(InitialRegisterState());

  final AuthRepoImpl _authRepoImpl;

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(LoadingRegisterState());
    var response = await _authRepoImpl.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    response.fold(
      (l) {
        if (l is RegisterFailure) {
          emit(FailureRegisterState(
            errMessage: l.errMessage,
            errTitle: l.errTitle,
          ));
        }
      },
      (r) {
        emit(SuccessRegisterState());
      },
    );
  }
}
