import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/share_trip_cubit/share_trip_state.dart';

class ShareTripCubit extends Cubit<ShareTripState> {
  ShareTripCubit(this.organizingTripImpl) : super(ShareTripInitial());
  final OrganizingTripImpl organizingTripImpl;

  Future<void> shareTrip({required String tripId}) async {
    emit(ShareTripLoading());
    var response = await organizingTripImpl.shareTrip(tripId: tripId);
    response.fold(
      (failure) {
        emit(ShareTripFailure(failure: failure));
      },
      (response) {
        emit(ShareTripSuccess());
      },
    );
  }
}
