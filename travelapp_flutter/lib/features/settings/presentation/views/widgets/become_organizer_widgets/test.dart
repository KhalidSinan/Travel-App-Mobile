// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:travelapp_flutter/core/helpers/service_locator.dart';
// import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
// import 'package:travelapp_flutter/core/helpers/validators.dart';
// import 'package:travelapp_flutter/core/utils/styles.dart';
// import 'package:travelapp_flutter/core/utils/themes.dart';
// import 'package:travelapp_flutter/core/widgets/custom_button.dart';
// import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
// import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
// import 'package:travelapp_flutter/features/auth/presentation/views/widgets/password_eye.dart';
// import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
// import 'package:travelapp_flutter/features/settings/data/repos/settings_repo_impl.dart';
// import 'package:travelapp_flutter/features/settings/presentation/view_model/become_organizer_cubit/become_organizer_cubit.dart';
// import 'package:travelapp_flutter/features/settings/presentation/view_model/delete_account_cubit/delete_account_cubit.dart';
// import 'package:travelapp_flutter/features/settings/presentation/view_model/delete_account_cubit/delete_account_cubit_states.dart';
// import 'package:travelapp_flutter/features/settings/presentation/views/becom_organizer_page.dart';
// import 'package:travelapp_flutter/features/settings/presentation/views/notifi_page.dart';
// import 'package:travelapp_flutter/features/settings/presentation/views/settings_page.dart';

// class Tests extends StatefulWidget {
//   const Tests({super.key});

//   @override
//   State<Tests> createState() => _TestsState();
// }

// class _TestsState extends State<Tests> with TickerProviderStateMixin {
  // late TabController tabController;

  // @override
  // void initState() {
  //   tabController = TabController(length: 3, vsync: this);
  //   super.initState();
  // }

  // void navigatScren(int index) {
  //   tabController.index = index;
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: CustomButton(
//         onPressed: () {
//           Get.to(() => Tests());
//         },
//         label: 'click',
//       ),
//     ));
//   }
// }

//----------------------------------------------------------//

// class DelelteAccountSheet extends StatefulWidget {
//   const DelelteAccountSheet({
//     super.key,
//   });

//   @override
//   State<DelelteAccountSheet> createState() => _DelelteAccountSheetState();
// }

// class _DelelteAccountSheetState extends State<DelelteAccountSheet>
//     with TickerProviderStateMixin {
//   bool obsecurePassword = true;
//   String? password;
//   String? code;
//   late TabController tabController;
//   GlobalKey<FormState> passwordKey = GlobalKey();
//   GlobalKey<FormState> codeKey = GlobalKey();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   @override
//   void initState() {
//     tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height / 2.5,
//         child: TabBarView(
//           controller: tabController,
//           children: [oneView(), twoView()],
//         ),
//       ),
//     );
//   }

//   void checkPassword() async {
//     if (passwordKey.currentState!.validate()) {
//       passwordKey.currentState!.save();
//       await BlocProvider.of<DeleteAccountCubit>(context)
//           .checkPassword(password: password!);
//     } else {
//       autovalidateMode = AutovalidateMode.always;
//       setState(() {});
//     }
//   }

//   void deleteAccount() async {
//     if (codeKey.currentState!.validate()) {
//       codeKey.currentState!.save();
//       await BlocProvider.of<DeleteAccountCubit>(context)
//           .deleteAccount(code: code!);
//     } else {
//       autovalidateMode = AutovalidateMode.always;
//       setState(() {});
//     }
//   }

//   Widget oneView() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 24, top: 24, right: 16),
//       child: BlocConsumer<DeleteAccountCubit, DeleteAccountStates>(
//         listener: checkPasswordListener,
//         builder: (context, state) {
//           return Form(
//             key: passwordKey,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Delete Account : ',
//                       style: Styles.content.copyWith(color: Themes.primary),
//                     ),
//                     const SizedBox(
//                       width: 120,
//                     ),
//                     Text(
//                       'Step 1/2',
//                       style: Styles.subtitle.copyWith(color: Themes.third),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 CustomTextAndTextForm(
//                   text: 'Your Password :',
//                   hintText: 'enter your password',
//                   prefixIcon: const Icon(Icons.password),
//                   validator: validatePassword,
//                   obsecureText: obsecurePassword,
//                   suffixIcon: PasswordEye(
//                     onToggle: toggleObsecurePassword,
//                   ),
//                   onSaved: (value) => password = value,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 (state is LoadingCheckPassword)
//                     ? const CircularProgressIndicator()
//                     : CustomButton(onPressed: checkPassword, label: 'countinue')
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void checkPasswordListener(context, state) {
//     if (state is FailureCheckPassword) {
//       showCustomSnackBar(title: 'Error', message: state.failure.errMessage);
//     } else if (state is SuccessCheckPassword) {
//       navigatScren(1);
//       showCustomSnackBar(title: 'success', message: "An Code Has Been Sent");
//     }
//   }

//   Widget twoView() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 24, top: 24, right: 16),
//       child: BlocConsumer<DeleteAccountCubit, DeleteAccountStates>(
//         listener: deleteAccountListener,
//         builder: (context, state) {
//           return Form(
//             key: codeKey,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Delete Account : ',
//                       style: Styles.content.copyWith(color: Themes.primary),
//                     ),
//                     const SizedBox(
//                       width: 120,
//                     ),
//                     Text(
//                       'Step 2/2',
//                       style: Styles.subtitle.copyWith(color: Themes.third),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 CustomTextAndTextForm(
//                   text: 'The code that was sent :',
//                   hintText: 'enter code',
//                   prefixIcon: const Icon(Icons.numbers),
//                   textInputType: TextInputType.number,
//                   validator: validateCode,
//                   onSaved: (value) => code = value,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 (state is LoadingDeleteAccount)
//                     ? const CircularProgressIndicator()
//                     : CustomButton(
//                         onPressed: deleteAccount, label: 'countinue'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void deleteAccountListener(context, state) {
//     if (state is FailureDeleteAccount) {
//       showCustomSnackBar(title: 'Erorr', message: state.failure.errMessage);
//     } else if (state is SuccessDeleteAccount) {
//       Get.until((route) => route.settings.name == '/LogIn');
//     }
//   }

//   void navigatScren(int index) {
//     tabController.index = index;
//   }

//   void toggleObsecurePassword() {
//     setState(() {
//       obsecurePassword = !obsecurePassword;
//     });
//   }
// }
