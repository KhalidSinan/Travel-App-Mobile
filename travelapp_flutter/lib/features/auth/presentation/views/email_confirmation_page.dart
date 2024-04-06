import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/email_confirm_cubit/email_confirm_cubit.dart';
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
        body: SafeArea(
          child: EmailConfirmationPageBody(email: email),
        ),
      ),
    );
  }
}
