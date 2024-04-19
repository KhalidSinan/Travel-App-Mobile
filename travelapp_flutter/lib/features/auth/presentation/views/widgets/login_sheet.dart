import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button_with_icon.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/fetch_profile_data_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/register_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_form.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key});

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  late final LocalAuthentication auth;
  bool _supportState = true;
  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    checkAvailablity();
  }

  void checkAvailablity() async {
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          _supportState = isSupported;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: MediaQuery.sizeOf(context).height * .75,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign in',
              style: Styles.heading.copyWith(fontSize: 40),
            ),
            const Text(
              'Welcome again, sign in to book your trip',
              style: Styles.subtitle,
            ),
            const SizedBox(height: 24),
            const LoginForm(),
            const SizedBox(height: 24),
            (_supportState)
                ? CustomButtonWithIcon(
                    label: 'Fingerprint',
                    onPressed: authenticate,
                    suffix: Icon(
                      FontAwesomeIcons.fingerprint,
                      color: Themes.primary,
                    ),
                  )
                : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                CustomTextButton(
                  onPressed: () => Get.to(() => const RegisterPage()),
                  label: 'Sign up',
                  color: Themes.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void authenticate() async {
    final prefs = getIt.get<SharedPreferences>();
    String? token = prefs.getString(tokenKey);
    if (token == null) {
      showCustomSnackBar(
        title: "You're not registered yet",
        message: "Make an account first to enable fingerprint",
      );
      return;
    }
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Sign in with your fingerprint',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      if (authenticated) {
        Get.off(() => FetchProfileDataPage(token: token));
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
