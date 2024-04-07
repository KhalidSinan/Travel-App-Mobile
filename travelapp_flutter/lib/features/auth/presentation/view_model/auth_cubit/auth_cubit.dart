import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/auth_cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepoImpl) : super(InitialAuthState());

  AuthRepoImpl authRepoImpl;
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    var response = await authRepoImpl.login(
      email: email,
      password: password,
    );
    response.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureLoginState(errMessage: l.errMessage));
        }
      },
      (r) => emit(SuccessLoginState()),
    );
  }
}
