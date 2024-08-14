import 'package:travelapp_flutter/features/settings/data/models/notifi_model.dart';

class AllNotifiModel {
  final List<NotifiModel>? today;
  final List<NotifiModel>? yesterday;
  final List<NotifiModel>? week;
  final List<NotifiModel>? month;
  final List<NotifiModel>? year;
  final List<NotifiModel>? moreThanYear;

  AllNotifiModel(
      {this.today,
      this.yesterday,
      this.week,
      this.month,
      this.year,
      this.moreThanYear});

  factory AllNotifiModel.fromJson(jsonData) {
    List<NotifiModel>? today;
    if (jsonData['today'] != null) {
      today = [];
      for (int i = 0; i < jsonData['today'].length; i++) {
        today.add(NotifiModel.fromJson(jsonData['today'][i]));
      }
    }

    List<NotifiModel>? yesterday;
    if (jsonData['yesterday'] != null) {
      yesterday = [];
      for (int i = 0; i < jsonData['yesterday'].length; i++) {
        yesterday.add(NotifiModel.fromJson(jsonData['yesterday'][i]));
      }
    }

    List<NotifiModel>? week;
    if (jsonData['week'] != null) {
      week = [];
      for (int i = 0; i < jsonData['week'].length; i++) {
        week.add(NotifiModel.fromJson(jsonData['week'][i]));
      }
    }

    List<NotifiModel>? month;
    if (jsonData['month'] != null) {
      month = [];
      for (int i = 0; i < jsonData['month'].length; i++) {
        month.add(NotifiModel.fromJson(jsonData['month'][i]));
      }
    }

    List<NotifiModel>? year;
    if (jsonData['year'] != null) {
      year = [];
      for (int i = 0; i < jsonData['year'].length; i++) {
        year.add(NotifiModel.fromJson(jsonData['year'][i]));
      }
    }
    List<NotifiModel>? moreThanYear;
    if (jsonData['moreThanYear'] != null) {
      moreThanYear = [];
      for (int i = 0; i < jsonData['moreThanYear'].length; i++) {
        moreThanYear.add(NotifiModel.fromJson(jsonData['moreThanYear'][i]));
      }
    }

    return AllNotifiModel(
        today: today,
        yesterday: yesterday,
        week: week,
        month: month,
        year: year,
        moreThanYear: moreThanYear);
  }
}
