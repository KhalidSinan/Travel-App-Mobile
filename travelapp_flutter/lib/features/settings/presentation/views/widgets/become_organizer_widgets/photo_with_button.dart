import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';

class PhotoWithButton extends StatefulWidget {
  const PhotoWithButton({
    super.key,
    required this.defaultphoto,
    this.width,
    this.radius,
    this.label,
    this.hight,
    required this.text,
    required this.onPressed, this.selectedPhoto,
  });
  final String text;
  final String defaultphoto;
  final double? width;
  final double? radius;
  final String? label;
  final double? hight;
  final VoidCallback onPressed;
  final File? selectedPhoto;

  @override
  State<PhotoWithButton> createState() => _PhotoWithButtonState();
}

// File? personalId;
// File? workId;
// File? lastCertificate;
// File? personalPicture;
// File? selectedPhoto;

class _PhotoWithButtonState extends State<PhotoWithButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 10),
          child: Text(
            widget.text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius ?? 10),
              child: widget.selectedPhoto == null
                  ? Image.asset(
                      widget.defaultphoto,
                      height: widget.hight ?? 80,
                      width: widget.width ?? 140,
                      fit: BoxFit.fill,
                    )
                  : Image.file(
                      widget.selectedPhoto!,
                      height: widget.hight ?? 80,
                      width: widget.width ?? 160,
                      fit: BoxFit.fill,
                    ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: CustomButton(
                onPressed: widget.onPressed,
                label: widget.label ?? 'add photo',
                color: Themes.secondary,
                colorText: Themes.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Future<void> permission(BuildContext context) async {
  //    Map<Permission, PermissionStatus> statuses = await [
  //     Permission.storage,
  //     Permission.camera,
  //   ].request();
  //   if (statuses[Permission.storage]!.isGranted &&
  //       statuses[Permission.camera]!.isGranted) {
  //     showImagePicker(context);
  //   } else {
  //     print('no permission provided');
  //   }
  // }

//   final picker = ImagePicker();
//    showImagePicker(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return Card(
//             child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 5.2,
//                 margin: const EdgeInsets.only(top: 8.0),
//                 padding: const EdgeInsets.all(12),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                         child: InkWell(
//                       child: const Column(
//                         children: [
//                           Icon(
//                             Icons.image,
//                             size: 60.0,
//                           ),
//                           SizedBox(height: 12.0),
//                           Text(
//                             "Gallery",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 16, color: Colors.black),
//                           )
//                         ],
//                       ),
//                       onTap: () {
//                         imgFromGallery();
//                         Navigator.pop(context);
//                       },
//                     )),
//                     Expanded(
//                         child: InkWell(
//                       child: const SizedBox(
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.camera_alt,
//                               size: 60.0,
//                             ),
//                             SizedBox(height: 12.0),
//                             Text(
//                               "Camera",
//                               textAlign: TextAlign.center,
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.black),
//                             )
//                           ],
//                         ),
//                       ),
//                       onTap: () {
//                          imgFromCamera();
//                         Navigator.pop(context);
//                       },
//                     ))
//                   ],
//                 )),
//           );
//         });

//   }

//   imgFromGallery() async {
//     await picker
//         .pickImage(source: ImageSource.gallery, imageQuality: 50)
//         .then((value) {
//       if (value != null) {
//         cropImage(File(value.path));
//       }
//     });
//   }

//  imgFromCamera() async {
//     await picker
//         .pickImage(source: ImageSource.camera, imageQuality: 50)
//         .then((value) {
//       if (value != null) {
//         cropImage(File(value.path));
//       }
//     });
//   }

//  cropImage(File imgFile) async {
//     final croppedFile = await ImageCropper().cropImage(
//         sourcePath: imgFile.path,

//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             activeControlsWidgetColor: Themes.third,
//             toolbarColor: Themes.primary,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false,
//             aspectRatioPresets: [
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio3x2,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPreset.ratio16x9
//             ],
//           ),
//           IOSUiSettings(
//             title: "Image Cropper",
//           )
//         ]);
//     if (croppedFile != null) {
//       imageCache.clear();
//       setState(() {
//         switch (widget.namePhoto) {
//           case 'personalPicture':
//             selectedPhoto = File(croppedFile.path);
//             BlocProvider.of<BecomeOrganizerCubit>(context).personalPicture =
//                 selectedPhoto;

//           case 'lastCertificate':
//             selectedPhoto = File(croppedFile.path);
//             BlocProvider.of<BecomeOrganizerCubit>(context).lastCertificate =
//                 selectedPhoto;

//           case 'workId':
//             selectedPhoto = File(croppedFile.path);
//             BlocProvider.of<BecomeOrganizerCubit>(context).workId =
//                 selectedPhoto;

//           case 'personalId':
//             selectedPhoto = File(croppedFile.path);
//             BlocProvider.of<BecomeOrganizerCubit>(context).personalId =
//                 selectedPhoto;
//         }

//         // personalPicture = File(croppedFile.path);
//       });
//       // reload();
//     }
//   }
}
