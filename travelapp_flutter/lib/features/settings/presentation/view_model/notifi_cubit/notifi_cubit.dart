import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/settings/data/models/all_notifi_model.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/notifi_cubit/notifi_cubit_states.dart';

class NotifiPageCubit extends Cubit<NotifiStates> {
  NotifiPageCubit(this.settingsRepoImpl) : super(NotifiInitial());

  final SettingsRepoImpl settingsRepoImpl;
  AllNotifiModel? allNotifications;

  Future<void> getAllNotifications() async {
    emit(NotifiLoadingState());
        await Future.delayed(const Duration(seconds: 1));

    var response = await settingsRepoImpl.getAllNotifications();
    response.fold(
      (failure) => emit(NotifiFailureState(failure: failure)),
      (response) {
        allNotifications = AllNotifiModel.fromJson(response);
        emit(NotifiSuccessState(allNotifiModel: allNotifications));
      },
    );
  }
}
