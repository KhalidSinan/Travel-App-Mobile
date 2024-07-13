import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/settings/data/models/profile_model.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/profile_header.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/profile_page_widgets/user_data.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  ProfileModel? profile;
  @override
  void initState() {
    super.initState();
    profile = BlocProvider.of<ProfilePageCubit>(context).profile;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(
            photo: profile!.photo,
            fname: BlocProvider.of<ProfilePageCubit>(context).editFname!,
            lname: BlocProvider.of<ProfilePageCubit>(context).editLname!,
          ),
          const SizedBox(height: 30),
          UserData(
            icon: Icons.email_outlined,
            text: profile!.email,
            type: 'email',
          ),
          UserData(
            icon: Icons.call_outlined,
            text: 
            //'${profile!.number?.code}  ${profile!.number?.number}',
            '+${BlocProvider.of<ProfilePageCubit>(context).editCode}  ${BlocProvider.of<ProfilePageCubit>(context).editNumber}',
            type: 'number',
          ),
          UserData(
            icon: Icons.location_on_outlined,
            text:
                '${BlocProvider.of<ProfilePageCubit>(context).editCity}, ${BlocProvider.of<ProfilePageCubit>(context).editCountry}',
            type: 'location',
          ),
          UserData(
            icon: profile!.gender == 'Female'
                ? Icons.female_outlined
                : profile!.gender == 'Male'
                    ? Icons.male_outlined
                    : Icons.question_mark_outlined,
            text: profile!.gender,
            type: 'gender',
          ),
          UserData(
            icon: Icons.calendar_today_outlined,
            text: BlocProvider.of<ProfilePageCubit>(context).editDate,
            type: 'date',
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        ],
      ),
    );
  }
}
