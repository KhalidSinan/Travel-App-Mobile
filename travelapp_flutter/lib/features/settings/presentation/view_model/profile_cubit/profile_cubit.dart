// ignore_for_file: avoid_print
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/cities_airline_model.dart';
import 'package:travelapp_flutter/features/settings/data/models/profile_model.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit_state.dart';

class ProfilePageCubit extends Cubit<ProfileStates> {
  ProfilePageCubit(this.settingsRepoImpl) : super(ProfileInitial());

  final SettingsRepoImpl settingsRepoImpl;
  List<CountryModel> cities = [];
  ProfileModel? profile;
  FormData? body;
  File? editImage;
  String? editCity,
      editCountry,
      editDate,
      editGender,
      editNumber,
      editCode,
      editFname,
      editLname;

  Future<void> getCountries() async {
    var response = await settingsRepoImpl.getCities();
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        for (var i = 0; i < response['cities'].length; i++) {
          cities.add(CountryModel.fromJson(response["cities"][i]));
        }
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> getUserData() async {
    emit(ProfileLoadingState());
    var response = await settingsRepoImpl.getUserData();
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        profile = ProfileModel.fromJson(response['profile']);
        editCity = profile!.location.city;
        editCountry = profile!.location.country;
        editDate = profile!.birthDate;
        editNumber = profile!.number?.number;
        editCode = profile!.number?.code;
        editFname = profile!.name.first;
        editLname = profile!.name.last;
        editGender = profile!.gender;
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> changeLocation() async {
    emit(ProfileLoadingState());
    var response = await settingsRepoImpl.changeLocation(body: {
      "country": editCountry,
      "city": editCity,
    });
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> changeNumber() async {
    emit(ProfileLoadingState());
    var response = await settingsRepoImpl.changeNumber(body: {
      "country_code": editCode,
      "number": editNumber,
    });
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> changeName() async {
    emit(ProfileLoadingState());
    var response = await settingsRepoImpl.changeName(body: {
      "first_name": editFname,
      "last_name": editLname,
    });
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> changeDate() async {
    emit(ProfileLoadingState());
    var response = await settingsRepoImpl.changeDate(body: {
      "date": editDate,
    });
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> changeGender() async {
    emit(ProfileLoadingState());
    var response = await settingsRepoImpl.setGender(body: {
      "gender": editGender,
    });
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> changeImage() async {
    emit(ProfileLoadingState());
    var response = await settingsRepoImpl.changeImage(
      body: FormData.fromMap(
        {
          "profile_pic": await MultipartFile.fromFile(
            editImage!.path,
            filename: editImage!.path.split('/').last,
          ),
        },
      ),
    );
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> updating() async {
    if (editCity != null && editCountry != null) {
      await changeLocation();
    }
    if (editGender != null) {
      await changeGender();
    }
    if (editImage != null) {
      await changeImage();
    }
    if (editFname != null && editLname != null) {
      await changeName();
    }
    if (editDate != null) {
      await changeDate();
    }
    if (editCode != null && editNumber != null) {
      await changeNumber();
    }
  }
}
