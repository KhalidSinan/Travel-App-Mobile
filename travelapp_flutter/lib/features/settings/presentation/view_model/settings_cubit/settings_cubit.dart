import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/settings_cubit/settings_cubit_state.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitial());
}
