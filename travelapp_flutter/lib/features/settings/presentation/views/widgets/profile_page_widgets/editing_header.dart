import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';

class EditingHeader extends StatefulWidget {
  const EditingHeader({super.key, required this.photo});
  final String? photo;

  @override
  State<EditingHeader> createState() => _EditingHeaderState();
}

class _EditingHeaderState extends State<EditingHeader> {
  ImageProvider? image;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    if (widget.photo != null) {
      image = NetworkImage(
          'http://10.0.2.2:5000/${widget.photo}');
    }
  }

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
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey,
                backgroundImage:
                    BlocProvider.of<ProfilePageCubit>(context).editImage != null
                        ? FileImage(BlocProvider.of<ProfilePageCubit>(context)
                            .editImage!
                            .absolute)
                        : image,
                child: image == null && BlocProvider.of<ProfilePageCubit>(context).editImage == null
                    ? const Icon(
                        Icons.person_rounded,
                        size: 100,
                        color: Colors.white,
                      )
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    getImage();
                  },
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: TextFormField(
                    cursorHeight: 32,
                    initialValue:
                        BlocProvider.of<ProfilePageCubit>(context).editFname,
                    textAlign: TextAlign.center,
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
                const SizedBox(width: 6),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: TextFormField(
                    cursorHeight: 32,
                    initialValue:
                        BlocProvider.of<ProfilePageCubit>(context).editLname,
                    textAlign: TextAlign.center,
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
        ],
      ),
    );
  }

  Future getImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        if (picked != null) {
          BlocProvider.of<ProfilePageCubit>(context).editImage =
              File(picked.path);
        }
      },
    );
  }
}
