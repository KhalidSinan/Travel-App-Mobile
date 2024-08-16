import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/settings/data/models/profile_model.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/profile_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/editing_data.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/editing_header.dart';

class EditingPageBody extends StatefulWidget {
  const EditingPageBody({super.key});

  @override
  State<EditingPageBody> createState() => _EditingPageBodyState();
}

class _EditingPageBodyState extends State<EditingPageBody> {
  ProfileModel? profile;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    profile = BlocProvider.of<ProfilePageCubit>(context).profile;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            EditingHeader(photo: profile!.photo),
            const SizedBox(height: 10),
            EditingData(
              icon: Icons.email_outlined,
              text: profile!.email,
              type: 'email',
            ),
            const EditingData(
              icon: Icons.call_outlined,
              type: 'number',
            ),
            const EditingData(
              icon: Icons.location_on_outlined,
              type: 'location',
            ),
            EditingData(
              icon: BlocProvider.of<ProfilePageCubit>(context).editGender ==
                      'Female'
                  ? Icons.female_outlined
                  : BlocProvider.of<ProfilePageCubit>(context).editGender ==
                          'Male'
                      ? Icons.male_outlined
                      : Icons.question_mark_outlined,
              type: 'gender',
            ),
            const EditingData(
              icon: Icons.calendar_today_outlined,
              type: 'date',
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CustomButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await BlocProvider.of<ProfilePageCubit>(context)
                            .updating();
                        Get.off(const ProfilePage());
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    label: 'Save',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CustomButton(
                    onPressed: () async {
                      Get.off(const ProfilePage());
                    },
                    color: Colors.grey,
                    label: 'Cancel',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
