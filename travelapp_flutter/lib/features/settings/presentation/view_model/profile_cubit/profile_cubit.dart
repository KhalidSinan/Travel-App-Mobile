import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/cities_airline_model.dart';
import 'package:travelapp_flutter/features/settings/data/models/location_model.dart';
import 'package:travelapp_flutter/features/settings/data/models/profile_model.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit_state.dart';

class ProfilePageCubit extends Cubit<ProfileStates> {
  ProfilePageCubit(this.settingsRepoImpl) : super(ProfileInitial());

  final SettingsRepoImpl settingsRepoImpl;
  List<CountryModel> cities = [];
  LocationModel? location;
  ProfileModel? profile;
  bool? onEditing;
  String? editCity,
      editCountry,
      editDate,
      editNumber,
      editCode,
      editFname,
      editLname;

  void editState() {
    onEditing = true;
    emit(EditingState());
    print('name : $editFname $editLname');
    print('number : $editCode $editNumber');
    print('location : $editCity, $editCountry');
    print('date : $editDate');
  }

  void saveState() {
    onEditing = false;
    emit(ProfileSuccessState());
    print('name : $editFname $editLname');
    print('number : $editCode $editNumber');
    print('location : $editCity, $editCountry');
    print('date : $editDate');
  }

  Future<void> getCountries() async {
    var response = await settingsRepoImpl.getCities();
    response.fold(
      (failure) => emit(ProfileFailureState(failure: failure)),
      (response) {
        for (var i = 0; i < response['cities'].length; i++) {
          cities.add(CountryModel.fromJson(response["cities"][i]));
        }
        emit(EditingState());
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
        location = LocationModel.fromJson(response['location']);
        editCity = location!.city;
        editCountry = location!.country;
        emit(ProfileSuccessState());
      },
    );
  }

  Future<void> changeNumber() async {
    emit(ProfileLoadingState());
    var response = await settingsRepoImpl.changeNumber(body: {
      "country_code": editCode?.substring(1),
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
}
