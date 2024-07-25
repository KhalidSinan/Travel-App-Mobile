import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit_state.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/editing_page_body.dart';

class EditingPage extends StatefulWidget {
  const EditingPage({super.key});

  @override
  State<EditingPage> createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  @override
  void initState() {
    super.initState();
    getUserData();
    getCities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.primary,
        leading: const CustomBackButton(color: Colors.white),
      ),
      body: BlocConsumer<ProfilePageCubit, ProfileStates>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const EditingPageBody();
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
    );
  }

  void getCities() async {
    await BlocProvider.of<ProfilePageCubit>(context).getCountries();
  }

  void getUserData() async {
    await BlocProvider.of<ProfilePageCubit>(context).getUserData();
  }
}
