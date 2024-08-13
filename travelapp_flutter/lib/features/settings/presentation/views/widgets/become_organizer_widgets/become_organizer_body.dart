import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/become_organizer_cubit/become_organizer_cubit.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/become_organizer_cubit/become_organizer_cubit_state.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/become_organizer_widgets/custom_text_and_text_filled_organizer.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/become_organizer_widgets/dialog_becom_organizer.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/become_organizer_widgets/photo_with_button.dart';

class BecomeOrganizerPageBody extends StatefulWidget {
  const BecomeOrganizerPageBody({
    super.key,
  });

  @override
  State<BecomeOrganizerPageBody> createState() =>
      _BecomeOrganizerPageBodyState();
}

GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();
List<String> companiesWorkedFor = [];
List<String> exampleCompanies = ['company1', 'company2'];
String? companyName;
String? yearsOfExperience;
File? personalId;
File? workId;
File? lastCertificate;
File? personalPicture;

class _BecomeOrganizerPageBodyState extends State<BecomeOrganizerPageBody> {
  @override
  Widget build(BuildContext context) {
     String userName = BlocProvider.of<ProfileCubit>(context).profile!.fullName;
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 16),
            child: Column(
              children: [
                Text(
                  // add userName
                  'Dear $userName',
                  style: Styles.heading2
                      .copyWith(color: Themes.third, fontSize: 25),
                ),
                Text(
                  'To be organizer, you must enter the following information :',
                  style: Styles.heading2
                      .copyWith(color: Themes.primary, fontSize: 20),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          color: Colors.white,
                          border: Border.all(color: Themes.primary)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextAndTextForm(
                              text: 'Your Company name :',
                              prefixIcon: const Icon(FontAwesomeIcons.building),
                              hintText: 'enter the company ',
                              controller: controller1,
                              onSaved: (value) => companyName = value,
                              validator: validateName,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomTextAndTextForm(
                              text: 'Years of experience :',
                              prefixIcon: const Icon(FontAwesomeIcons.fileCode),
                              hintText: 'enter num of years',
                              textInputType: TextInputType.number,
                              controller: controller2,
                              onSaved: (value) => yearsOfExperience = value,
                              validator: validateName,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextAndTextFilledOrganizer(
                                      text: 'Companies you works its :',
                                      prefixIcon: const Icon(
                                          FontAwesomeIcons.solidBuilding),
                                      hintText: 'enter the years',
                                      controller: controller3,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 30, left: 8),
                                    child: IconButton(
                                      iconSize: 25,
                                      onPressed: () {
                                        if (controller3.text.isNotEmpty) {
                                          setState(() {
                                            companiesWorkedFor
                                                .add(controller3.text);
                                            controller3.clear();
                                            print(companiesWorkedFor);
                                          });
                                        } else {
                                          print('ssss $companiesWorkedFor');
                                        }
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Themes.secondary,
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Themes.primary)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            companiesWorkedFor.isNotEmpty
                                ? Center(child: buildChip())
                                : Center(child: buildNullChip()),
                            const SizedBox(
                              height: 30,
                            ),
                            PhotoWithButton(
                              text: 'Your personal picture :',
                              defaultphoto: Assets.personal,
                              label: 'add your personal picture',
                              width: 90,
                              hight: 90,
                              radius: 150.0,
                              onPressed: () async {
                                await permission(context, 'personalPicture');
                              },
                              selectedPhoto: personalPicture,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            PhotoWithButton(
                              text: 'Your personal card photo  :',
                              defaultphoto: 'assets/images/personal_card .jpg',
                              onPressed: () async {
                                await permission(context, 'personalId');
                              },
                              selectedPhoto: personalId,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            PhotoWithButton(
                              text: 'Your work card photo :',
                              defaultphoto: 'assets/images/work_card.jpg',
                              onPressed: () async {
                                await permission(context, 'workId');
                              },
                              selectedPhoto: workId,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            PhotoWithButton(
                              text: 'Your last certificate photo  :',
                              defaultphoto:
                                  'assets/images/last_certificate.jpg',
                              onPressed: () async {
                                await permission(context, 'lastCertificate');
                              },
                              selectedPhoto: lastCertificate,
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                BlocConsumer<BecomeOrganizerCubit, BecomeOrganizerStates>(
                  listener: (context, state) async {
                    if (state is BecomeOrganizerFailureState) {
                      await dialogBecomeOrganizer(
                        context: context,
                        title: 'Warning ',
                        content: state.failure.errMessage,
                        colorTitle: Themes.third,
                        icon: FontAwesomeIcons.triangleExclamation,
                        colorIcon: Themes.third,
                        colorLabel: Themes.third,
                      );
                    } else if (state is BecomeOrganizerSuccessState) {
                      await dialogBecomeOrganizer(
                        context: context,
                        title: 'Success',
                        content: state.successMessage,
                        colorTitle: Themes.primary,
                        icon: FontAwesomeIcons.userCheck,
                        colorIcon: Themes.primary,
                        colorLabel: Themes.primary,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is BecomeOrganizerLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox(
                          height: 60,
                          width: 200,
                          child: CustomButton(
                              onPressed: becomeOrganizer, label: 'Join Us'));
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChip() => Wrap(
        runSpacing: 8,
        spacing: 8.0,
        children: companiesWorkedFor
            .map(
              (company) => Chip(
                label: Text(company),
                deleteIconColor: Colors.redAccent,
                onDeleted: () {
                  setState(() {
                    companiesWorkedFor.remove(company);
                  });
                },
              ),
            )
            .toList(),
      );

  Widget buildNullChip() => Wrap(
        runSpacing: 8,
        spacing: 8.0,
        children: exampleCompanies
            .map(
              (company) => Chip(
                label: Text(company),
                labelStyle: const TextStyle(color: Colors.grey),
              ),
            )
            .toList(),
      );

  void becomeOrganizer() async {
    if (personalPicture == null ||
        personalId == null ||
        workId == null ||
        lastCertificate == null) {
      showCustomSnackBar(title: 'Filled', message: 'All images is required !');
    } else {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        await BlocProvider.of<BecomeOrganizerCubit>(context).becomOrganizer(
            companyName: companyName!,
            yearsOfExperience: yearsOfExperience!,
            companiesWorkedFor: companiesWorkedFor,
            personalPicture: personalPicture!,
            personalId: personalId!,
            workId: workId!,
            lastCertificate: lastCertificate!);
      } else {
        autovalidateMode = AutovalidateMode.always;
        setState(() {});
      }
    }
  }

  BoxDecoration hotelSelectCardDecoration() {
    return BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: Themes.primary, width: 2),
    );
  }

  Future<void> permission(BuildContext context, String namePhoto) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.camera,
    ].request();
    if (statuses[Permission.storage]!.isGranted &&
        statuses[Permission.camera]!.isGranted) {
      showImagePicker(context, namePhoto);
    } else {
      print('no permission provided');
    }
  }

  final picker = ImagePicker();
  showImagePicker(BuildContext context, String namePhoto) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            color: Themes.primary,
                            size: 60.0,
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16, color: Themes.primary),
                          )
                        ],
                      ),
                      onTap: () {
                        imgFromGallery(namePhoto);
                        Navigator.pop(context);
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: Themes.primary,
                              size: 60.0,
                            ),
                            const SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, color: Themes.primary),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        imgFromCamera(namePhoto);
                        Navigator.pop(context);
                      },
                    ))
                  ],
                )),
          );
        });
  }

  imgFromGallery(String namePhoto) async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        cropImage(File(value.path), namePhoto);
      }
    });
  }

  imgFromCamera(String namePhoto) async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        cropImage(File(value.path), namePhoto);
      }
    });
  }

  cropImage(File imgFile, String namePhoto) async {
    final croppedFile =
        await ImageCropper().cropImage(sourcePath: imgFile.path, uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Cropper',
        activeControlsWidgetColor: Themes.third,
        toolbarColor: Themes.primary,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
      ),
      IOSUiSettings(
        title: "Image Cropper",
      )
    ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        switch (namePhoto) {
          case 'personalPicture':
            personalPicture = File(croppedFile.path);

          case 'lastCertificate':
            lastCertificate = File(croppedFile.path);

          case 'workId':
            workId = File(croppedFile.path);

          case 'personalId':
            personalId = File(croppedFile.path);
        }
      });
      // reload();
    }
  }
}
