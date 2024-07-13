import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/settings/data/models/profile_model.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/editing_data.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/editing_header.dart';

class EditingPageBody extends StatefulWidget {
  const EditingPageBody({super.key});

  @override
  State<EditingPageBody> createState() => _EditingPageBodyState();
}

class _EditingPageBodyState extends State<EditingPageBody> {
  ProfileModel? profile;
  @override
  void initState() {
    super.initState();
    getCities();
    profile = BlocProvider.of<ProfilePageCubit>(context).profile;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const EditingHeader(),
          const SizedBox(height: 30),
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
            icon: profile!.gender == 'Female'
                ? Icons.female_outlined
                : profile!.gender == 'Male'
                    ? Icons.male_outlined
                    : Icons.question_mark_outlined,
            text: profile!.gender ?? 'Male/Female',
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
                    if (BlocProvider.of<ProfilePageCubit>(context).editCity !=
                            null &&
                        BlocProvider.of<ProfilePageCubit>(context)
                                .editCountry !=
                            null) {
                      BlocProvider.of<ProfilePageCubit>(context)
                          .changeLocation();
                    }
                    if (BlocProvider.of<ProfilePageCubit>(context).editCode !=
                            null &&
                        BlocProvider.of<ProfilePageCubit>(context).editNumber !=
                            null) {
                      BlocProvider.of<ProfilePageCubit>(context).changeNumber();
                    }
                    if (BlocProvider.of<ProfilePageCubit>(context).editFname !=
                            null &&
                        BlocProvider.of<ProfilePageCubit>(context).editLname !=
                            null) {
                      BlocProvider.of<ProfilePageCubit>(context).changeName();
                    }
                    if (BlocProvider.of<ProfilePageCubit>(context).editDate !=
                        null) {
                      BlocProvider.of<ProfilePageCubit>(context).changeDate();
                    }
                    BlocProvider.of<ProfilePageCubit>(context).saveState();
                    // BlocProvider.of<ProfilePageCubit>(context)
                    //     .changeState(false);
                    // await BlocProvider.of<ProfilePageCubit>(context)
                    //     .getUserData();
                  },
                  label: 'Save',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: CustomButton(
                  onPressed: () async {
                    BlocProvider.of<ProfilePageCubit>(context).editCity =
                        profile!.location.city;
                    BlocProvider.of<ProfilePageCubit>(context).editCountry =
                        profile!.location.country;
                    BlocProvider.of<ProfilePageCubit>(context).editCode =
                        profile!.number?.code;
                    BlocProvider.of<ProfilePageCubit>(context).editNumber =
                        profile!.number?.number;
                    BlocProvider.of<ProfilePageCubit>(context).editDate =
                        profile!.birthDate;
                    BlocProvider.of<ProfilePageCubit>(context).editFname =
                        profile!.name.first;
                    BlocProvider.of<ProfilePageCubit>(context).editLname =
                        profile!.name.last;
                    // BlocProvider.of<ProfilePageCubit>(context)
                    //     .changeState(false);
                    // await BlocProvider.of<ProfilePageCubit>(context)
                    //     .getUserData();
                  },
                  color: Themes.third,
                  label: 'Cancel',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void getCities() async {
    await BlocProvider.of<ProfilePageCubit>(context).getCountries();
  }
}
