import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button_with_icon.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/auth_cubit/auth_states.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/register_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_form.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is FailureLoginState) {
          Get.snackbar(
            'Error',
            state.errMessage,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      builder: (context, state) {
        return CustomSheet(
          height: MediaQuery.sizeOf(context).height * .75,
          child: SingleChildScrollView(
            child: (state is LoadingLoginState)
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in',
                        style: GoogleFonts.quattrocento().copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Themes.primary,
                        ),
                      ),
                      const Text(
                        'Welcome again, sign in to book your trip',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
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
                              // color: Colors.white70,
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
      },
    );
  }

  void authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Sign in with your fingerprint',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      if (authenticated) {
        print('login successfully');
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
