import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/email_confirm_cubit/email_confirm_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/register_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/email_confirm_page_body.dart';

class EmailConfirmationPage extends StatelessWidget {
  const EmailConfirmationPage({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailConfirmCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                final prefs = getIt.get<SharedPreferences>();
                prefs.remove('email-verify');
                prefs.remove('email-to-verify');
                Get.off(() => const LoginPage());
              },
              icon: const Icon(
                FontAwesomeIcons.remove,
                color: Colors.grey,
              )),
        ),
        body: SafeArea(
          child: EmailConfirmationPageBody(email: email),
        ),
      ),
    );
  }
}
