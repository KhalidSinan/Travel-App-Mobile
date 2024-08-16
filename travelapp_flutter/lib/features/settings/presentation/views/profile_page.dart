import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit_state.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/profile_page_body.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/editing_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primary,
        leading: const CustomBackButton(color: Colors.white),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.off(const EditingPage());
            },
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                overlayColor:
                    MaterialStatePropertyAll(Themes.third.withOpacity(0.1)),
                backgroundColor: MaterialStatePropertyAll(Themes.primary)),
            child: const Text(
              'Edit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<ProfilePageCubit, ProfileStates>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const Center(
                child: CustomLoading(),
              );
            } else {
              return const ProfilePageBody();
            }
          },
          listener: (context, state) {
            if (state is ProfileFailureState) {
              Get.to(
                () => FailurePage(
                  error: state.failure,
                  onPressed: () {},
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void getUserData() async {
    await BlocProvider.of<ProfilePageCubit>(context).getUserData();
  }
}
