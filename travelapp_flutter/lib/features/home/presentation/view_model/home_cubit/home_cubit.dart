import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/remaining_time_model.dart';
import 'package:travelapp_flutter/features/home/data/models/announcement_model.dart';
import 'package:travelapp_flutter/features/home/data/repos/home_repo_impl.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoImpl) : super(HomeInitial());

  final HomeRepoImpl homeRepoImpl;
  List<AnnouncementModel> announcements = [];
  List<PlaceModel>? places = [];
  RemainingTimeModel? timer;

  Future<void> getAnnouncements() async {
    emit(HomeLoading());
    var response = await homeRepoImpl.getAnnouncements();
    response.fold(
      (failure) => emit(HomeFailure(failure: failure)),
      (response) {
        announcements = [];
        if (response['data'].length != 0) {
          for (var i = 0; i < response['data'].length; i++) {
            announcements.add(AnnouncementModel.fromJson(response['data'][i]));
          }
        }
        emit(AnnouncementsSuccess());
      },
    );
  }

  Future<void> getNearbyPlaces() async {
    emit(HomeLoading());
    var response = await homeRepoImpl.getNearbyPlaces();
    response.fold(
      (failure) => emit(HomeFailure(failure: failure)),
      (response) {
        places = [];
        if (response['data'] != null) {
          for (var i = 0; i < response['data'].length; i++) {
            places!.add(PlaceModel.fromJson(response['data'][i]));
          }
        }
        emit(NearbySuccess());
      },
    );
  }

   Future<void> getTimer() async {
    emit(HomeLoading());
    var response = await homeRepoImpl.getTimer();
    response.fold(
      (failure) => emit(HomeFailure(failure: failure)),
      (response) {
        if (response['data'] == null) {
          timer == null;
        } else {
          timer = RemainingTimeModel.fromJson(response['data']);
        }
        emit(TimerSuccess());
      },
    );
  }

  Future<void> getHomeData() async {
    emit(HomeLoading());
    await getAnnouncements();
    await getTimer();
    await getNearbyPlaces();
    emit(HomeSuccess());
  }
}
