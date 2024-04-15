import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_steps_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/forgot_password_page_body.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: ForgotPasswordPageBody(),
        ),
      ),
    );
  }
}
