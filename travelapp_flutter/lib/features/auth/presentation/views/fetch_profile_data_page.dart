import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_states.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/test_page.dart';

class FetchProfileDataPage extends StatefulWidget {
  const FetchProfileDataPage({super.key, this.token});

  final String? token;

  @override
  State<FetchProfileDataPage> createState() => _FetchProfileDataPageState();
}

class _FetchProfileDataPageState extends State<FetchProfileDataPage> {
  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    await BlocProvider.of<ProfileCubit>(context).getProfileData(
      token: widget.token,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is GetDataFailure) {
            showCustomSnackBar(title: 'Error', message: state.errMessage);
            Get.off(() => const LoginPage());
          }
          if (state is GetDataSuccess) {
            Get.to(() => const TestPage());
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
