import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/becom_organizer_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/delete_account_sheet.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/our_team_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/rating_app_sheet.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/service_policy_page.dart';

final List<Map<String, dynamic>> settingsItems = [
  // {
  //   "title": "Trip History",
  //   "icon": Icons.history,
  //   "color": Colors.blue,
  //   "onTap": () {}
  // },
  // {
  //   "title": "General Setting",
  //   "icon": Icons.settings,
  //   "color": Colors.green,
  //   "onTap": () {}
  // },
  {
    "title": "Security",
    "icon": Icons.security,
    "color": Colors.red,
    "onTap": (BuildContext context) {}
  },
  // {
  //   "title": "Notification",
  //   "icon": Icons.notifications,
  //   "color": Colors.orange,
  //   "onTap": (BuildContext context) {}
  // },
  {
    "title": "Become Organizer",
    "icon": FontAwesomeIcons.personChalkboard,
    "color": Colors.purple,
    "onTap": (BuildContext context) {
      ProfileCubit bloc = BlocProvider.of<ProfileCubit>(context);
      Get.to(() => BecomOrganizerPage(bloc: bloc));
    }
  },
  {
    "title": "Our Team",
    "icon": Icons.people,
    "color": Colors.teal,
    "onTap": (BuildContext context) {
      Get.to(() => const OurTeamPage());
    }
  },
  {
    "title": " Service Policy",
    "icon": Icons.privacy_tip_outlined,
    "color": const Color.fromARGB(255, 14, 70, 116),
    "onTap": (BuildContext context) {
      Get.to(() => const ServicePolicyPage());
    }
  },
  {
    "title": "Report",
    "icon": FontAwesomeIcons.bug,
    "color": Colors.blue,
    "onTap": (BuildContext context) {}
  },
  {
    "title": "Rate Us",
    "icon": Icons.star,
    "color": Colors.amber,
    "onTap": (BuildContext context) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return const RatingAppSheet();
          });
    }
  },
  {
    "title": "Delete Account",
    "icon": Icons.delete_forever,
    "color": Colors.red,
    "onTap": (BuildContext context) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return const DelelteAccountSheet();
          });
    }
  },
  {
    "title": "Log Out",
    "icon": Icons.logout_outlined,
    "color": const Color.fromARGB(255, 14, 70, 116),
    "onTap": (BuildContext context) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        title: 'Log Out !',
        titleTextStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        desc: 'Are you sure you want to log out?',
        descTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        btnCancelColor: Themes.third,
        btnOkColor: Themes.primary,
        btnCancelOnPress: () {
          Get.back();
        },
        btnOkOnPress: () async {
          getIt.get<AuthRepoImpl>().token = null;
          final prefs = getIt.get<SharedPreferences>();
          await prefs.remove(rememberMeKey);
          await prefs.remove(tokenKey);
          Get.until(
            (route) => false,
          );
          Get.to(const LoginPage());
          showCustomSnackBar(
              title: 'Success', message: 'you are doing Log Out ');
        },
      ).show();
    }
  },
];
