import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
// import 'package:travelapp_flutter/core/widgets/failure_page.dart';
// import 'package:travelapp_flutter/features/settings/presentation/view_model/cubit/settings_cubit.dart';
// import 'package:travelapp_flutter/features/settings/presentation/view_model/cubit/settings_cubit_state.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/profile_page_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primary,
        leading: const CustomBackButton(color: Colors.white),
      ),
      body: const SafeArea(
        // child: BlocListener<SettingsCubit, SettingsStates>(
        //   listener: (context, state) {
        //     if (state is SettingsFailureState) {
        //       Get.to(
        //         () => FailurePage(
        //           error: state.failure,
        //           onPressed: () {},
        //         ),
        //       );
        //     }
        //   },
        child: ProfilePageBody(),
        //),
      ),
    );
  }
}
