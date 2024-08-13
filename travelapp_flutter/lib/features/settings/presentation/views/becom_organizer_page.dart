import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/become_organizer_cubit/become_organizer_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/become_organizer_widgets/become_organizer_body.dart';

class BecomOrganizerPage extends StatelessWidget {
  const BecomOrganizerPage({super.key, required this.bloc});

  final ProfileCubit bloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        BlocProvider(
            create: (context) =>
                BecomeOrganizerCubit(getIt.get<SettingsRepoImpl>()))
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: const [SizedBox(width: 15)],
          leading: const CustomBackButton(),
        ),
        body: const BecomeOrganizerPageBody(),
      ),
    );
  }
}
