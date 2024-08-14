import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';
import 'package:travelapp_flutter/features/organizer_report/data/models/organizer_model.dart';
import 'package:travelapp_flutter/features/organizer_report/data/repos/organizer_report_repo_impl.dart';
import 'package:travelapp_flutter/features/organizer_report/presentation/view_model/organizer_report_cubit/organizer_report_states.dart';

class OrganizerReportCubit extends Cubit<OrganizerReportStates> {
  OrganizerReportCubit(this.organizerReportRepoImpl)
      : super(InitialGetOrganizersState());
  final OrganizerReportRepoImpl organizerReportRepoImpl;

  List<OrganizerModel> organizers = [];

  Future<void> getOrganizersForReport() async {
    emit(LoadingGetOrganizersState());
    var response = await organizerReportRepoImpl.getOrganizersForReport();
    response.fold(
      (failure) {
        emit(FailureGetOrganizersState(failure: failure));
      },
      (res) {
        List<OrganizerModel> organizers = [];
        for (var jsonOrganizer in res['data']) {
          organizers.add(OrganizerModel.fromJson(jsonOrganizer));
        }
        print(organizers.isEmpty);
        if (organizers.isEmpty) {
          emit(NoOrganizersState());
          return;
        }
        this.organizers = organizers;
        emit(SuccessGetOrganizersState());
      },
    );
  }

  Future<void> reportOrganizer({
    required String organizerId,
    required String title,
    required String message,
  }) async {
    emit(LoadingOrganizerReportState());
    var response = await organizerReportRepoImpl.reportOrganizer(
      organizerId: organizerId,
      title: title,
      message: message,
    );
    response.fold(
      (failure) {
        emit(FailureOrganizerReportState(failure: failure));
      },
      (res) {
        emit(SuccessOrganizerReportState());
      },
    );
  }
}
