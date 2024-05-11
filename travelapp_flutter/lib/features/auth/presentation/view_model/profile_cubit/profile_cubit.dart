import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/auth/data/models/profile_model.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this._authRepoImpl) : super(InitialProfile());
  final AuthRepoImpl _authRepoImpl;
  ProfileModel? profile;

  Future<void> getProfileData({String? token}) async {
    emit(GetDataLoading());
    var response = await _authRepoImpl.getProfileData(
      token: token ?? _authRepoImpl.token!,
    );
    response.fold(
      (failure) {
        emit(GetDataFailure(failure: failure));
      },
      (res) {
        profile = ProfileModel.fromJson(res['profile']);
        print(profile!.fullName);
        print(profile!.email);
        emit(GetDataSuccess());
      },
    );
  }
}
