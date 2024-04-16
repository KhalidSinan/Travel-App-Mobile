import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._authRepoImpl) : super(InitialLoginState());

  final AuthRepoImpl _authRepoImpl;
  bool rememberMe = false;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    var response = await _authRepoImpl.login(
      email: email,
      password: password,
    );
    response.fold(
      (l) {
        if (l is LoginFailure) {
          emit(FailureLoginState(
            errMessage: l.errMessage,
            errTitle: l.errTitle,
          ));
        }
      },
      (res) async {
        await rememberUser();
        emit(SuccessLoginState());
      },
    );
  }

  Future<void> rememberUser() async {
    final prefs = getIt.get<SharedPreferences>();
    if (!rememberMe) {
      await prefs.remove(rememberMeKey);
    }
    await prefs.setBool(rememberMeKey, rememberMe);
  }
}
