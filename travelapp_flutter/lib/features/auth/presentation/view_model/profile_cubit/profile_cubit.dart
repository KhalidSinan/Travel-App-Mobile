import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/auth/data/models/profile_model.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this._authRepoImpl) : super(InitialProfile());
  final AuthRepoImpl _authRepoImpl;
  ProfileModel? profile;

  Future<void> getProfileData({required String token}) async {
    var response = await _authRepoImpl.getProfileData(token: token);
    response.fold(
      (l) {
        if (l is ServerFailure) {
          emit(GetDataFailure());
        }
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
