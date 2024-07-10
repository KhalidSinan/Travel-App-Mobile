import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/cities_airline_model.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/settings_cubit/settings_cubit_state.dart';
class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit(this.settingsRepoImpl) : super(SettingsInitial());
 final SettingsRepoImpl settingsRepoImpl;
  List<CountryModel> cities = [];

  Future<void> getCountries() async {
    emit(SettingLoadingState());
    var response = await settingsRepoImpl.getCities();
    response.fold(
      (failure) => emit(
        SettingsFailureState(failure: failure),
      ),
      (response) {
        for (var i = 0; i < response['cities'].length; i++) {
          cities.add(CountryModel.fromJson(response["cities"][i]));
          print(cities[i]);
        }
        emit(SettingsSuccessState());
      },
    );
  }
}
