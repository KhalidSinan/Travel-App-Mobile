import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';

class EditingHeader extends StatefulWidget {
  const EditingHeader({super.key});

  @override
  State<EditingHeader> createState() => _EditingHeaderState();
}

class _EditingHeaderState extends State<EditingHeader> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        color: Themes.primary,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(80),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey,
                  child:
                      // bloc == null
                      //     ?
                      Icon(
                    Icons.person_rounded,
                    size: 100,
                    color: Colors.white,
                  )
                  //: Image.asset(photo!, fit: BoxFit.fill),
                  ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.add_photo_alternate_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Form(
            key: formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextFormField(
                      cursorHeight: 32,
                      initialValue:
                          BlocProvider.of<ProfilePageCubit>(context).editFname,
                      textAlign: TextAlign.end,
                      cursorColor: Colors.white,
                      style: Styles.heading2.copyWith(color: Colors.white),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<ProfilePageCubit>(context).editFname =
                            value;
                      },
                      validator: validateName,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextFormField(
                      cursorHeight: 32,
                      initialValue:
                          BlocProvider.of<ProfilePageCubit>(context).editLname,
                      cursorColor: Colors.white,
                      style: Styles.heading2.copyWith(color: Colors.white),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<ProfilePageCubit>(context).editLname =
                            value;
                      },
                      validator: validateName,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
