import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/nav_bar_pages.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/cancel_organized_group_trip.dart';
import 'package:travelapp_flutter/features/home/presentation/views/my_reservations_page.dart';
import 'package:travelapp_flutter/features/home/presentation/views/my_trips.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/organizer_review_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/share_trip.dart';

class NotificationService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  static dynamic token;

  final _androiChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This Channel is used for important notification',
      importance: Importance.defaultImportance);

  final _localNotifications = FlutterLocalNotificationsPlugin();

  static void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // عند ارسال اشعار عام لكل المستخدمين
    if (message.data['type'] == "/notification-screen") {
      Get.to(() => const NavBarPages(
            initIndex: 3,
          ));
    }

    // عند اضافة اعلان بالداشبورد ارسال اشعار عام
    if (message.data['type'] == "/home-screen") {
      Get.to(() => const NavBarPages(
            initIndex: 0,
          ));
    }

    if (message.data['type'] == "/myTrips-screen") {
      Get.to(() => const MyTripsPage());
    }

    if (message.data['type'] == "/myReservations-screen") {
      Get.to(() => const MyReservationsPage());
    }

    // عند انتهاء رحلة جماعية من اجل تقييم المنظم
    if (message.data['type'] == "/rateOrganizer-screen") {
      String extraData = message.data['extra'];
      Map<String, dynamic> extraMap = jsonDecode(extraData);
      String id = extraMap['id'];
      String organizerName = extraMap['organizer_name'];
      Get.to(
          () => OrganizerReviewPage(tripId: id, organizerName: organizerName));
    }

    // عند انتهاء رحلة فردية من اجل مشاركة الرحلة
    if (message.data['type'] == "/shareTrip-screen") {
      String extraData = message.data['extra'];
      Map<String, dynamic> extraMap = jsonDecode(extraData);
      Get.to(() => ShareTripPage(id: extraMap['id']));
    }

    // الغاء المنظم رحلته الجماعية
    if (message.data['type'] == "/cancel-organized-group-screen") {
      String extraData = message.data['extra'];
      Map<String, dynamic> extraMap = jsonDecode(extraData);
      String source = extraMap['source'];
      String organizerName = extraMap['organizer_name'];
      String startDate = extraMap['start_date'];
      List<dynamic> des = extraMap['destinations'];
      Get.to(() => CancelOrganizedGroupTrip(
          organizerName: organizerName,
          startDate: startDate,
          source: source,
          des: des));
    }

    // قبل انتهاء الرحلة الجماعية بيوم
  }

  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/logo');

    const setting = InitializationSettings(
      android: android,
    );

    await _localNotifications.initialize(setting,
        onDidReceiveNotificationResponse: onTap);

    final platForm = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platForm?.createNotificationChannel(_androiChannel);
  }

  Future initPushNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    RemoteMessage? initialMessage =
        await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
                _androiChannel.id, _androiChannel.name,
                channelDescription: _androiChannel.description,
                icon: '@drawable/logo'),
          ),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    token = await _firebaseMessaging.getToken();
    print("device token:$token");

    initPushNotifications();
    initLocalNotifications();
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print(message.data);
    print('some notification received');
  }
}

onTap(NotificationResponse notificationResponse) {
  final payload = notificationResponse.payload;
  if (payload != null) {
    try {
      final message = RemoteMessage.fromMap(jsonDecode(payload));

      NotificationService.handleMessage(message);
    } catch (e) {
      print("Error decoding payload: $e");
    }
  }
}
