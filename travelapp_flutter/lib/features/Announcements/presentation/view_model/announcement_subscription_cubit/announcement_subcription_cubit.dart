import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/announcements/data/models/announcement_subscription_model.dart';
import 'package:travelapp_flutter/features/announcements/data/repos/announcements_repo_impl.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_states.dart';

class AnnouncementSubscriptionCubit
    extends Cubit<AnnouncementSubscriptionStates> {
  AnnouncementSubscriptionCubit(
    this.announcementsRepoImpl, {
    required this.tripId,
  }) : super(InitialGetSubscriptionsState());

  final AnnouncementsRepoImpl announcementsRepoImpl;
  final String tripId;
  AnnouncementSubscriptionModel? selectedSub;
  List<AnnouncementSubscriptionModel> subscriptions = [];

  Future<void> getAnnouncementSubscriptions() async {
    emit(LoadingGetSubscriptionsState());
    var response =
        await announcementsRepoImpl.getAnnouncementsOptions(tripId: tripId);
    response.fold(
      (failure) {
        emit(FailureGetSubscriptionsState(failure: failure));
      },
      (res) {
        List<AnnouncementSubscriptionModel> subscriptions = [];
        for (var jsonSubscription in res['data']) {
          subscriptions
              .add(AnnouncementSubscriptionModel.fromJson(jsonSubscription));
        }
        this.subscriptions = subscriptions;
        emit(SuccessGetSubscriptionsState());
      },
    );
  }

  Future<void> makeAnnouncement({
    required int duration,
    required String location,
    String? title,
    String? body,
  }) async {
    emit(LoadingSubscribeState());
    var response = await announcementsRepoImpl.makeAnnouncement(
      tripId: tripId,
      title: title ?? '',
      body: body ?? '',
      duration: duration,
      location: location,
    );

    response.fold(
      (failure) {
        emit(FailureSubscribeState(failure: failure));
      },
      (res) {
        emit(SuccessSubscribeState());
      },
    );
  }

  Future<void> subscribe() async {
    if (selectedSub!.place == 'Home') {
      emit(SelectedSubscribeHomeState());
      return;
    } else {
      await makeAnnouncement(
        duration: selectedSub!.duration,
        location: selectedSub!.place,
      );
    }
  }

  List<AnnouncementSubscriptionModel> getHomeSubscriptions() {
    final homeSubscriptions = subscriptions
        .where((subscription) => subscription.place == 'Home')
        .toList();
    homeSubscriptions.sort(
      (a, b) => b.price.ceil() - a.price.ceil(),
    );
    return homeSubscriptions;
  }

  List<AnnouncementSubscriptionModel> getOrganizedSubscriptions() {
    final organizedSubscriptions = subscriptions
        .where((subscription) => subscription.place == 'Organized')
        .toList();
    organizedSubscriptions.sort(
      (a, b) => b.price.ceil() - a.price.ceil(),
    );
    return organizedSubscriptions;
  }

  void selectSubscribe(AnnouncementSubscriptionModel subscribe) {
    if (selectedSub == subscribe) {
      cancelSubscribe();
      return;
    }
    selectedSub = subscribe;
    emit(SelectSubscribeState());
  }

  void cancelSubscribe() {
    selectedSub = null;
    emit(SelectSubscribeState());
  }
}
