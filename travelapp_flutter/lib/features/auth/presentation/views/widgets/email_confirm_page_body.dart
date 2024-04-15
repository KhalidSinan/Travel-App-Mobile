import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/email_confirm_cubit/email_confirm_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/email_confirm_cubit/email_confirm_states.dart';
import 'package:travelapp_flutter/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/pin_code.dart';

class EmailConfirmationPageBody extends StatefulWidget {
  const EmailConfirmationPageBody({super.key, required this.email});
  final String email;

  @override
  State<EmailConfirmationPageBody> createState() =>
      _EmailConfirmationPageBodyState();
}

class _EmailConfirmationPageBodyState extends State<EmailConfirmationPageBody> {
  final List<int> code = List.filled(6, -1);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailConfirmCubit, EmailConfirmStates>(
      listener: emailConfirmListener,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Text(
              'Email Verification',
              style: Styles.heading,
            ),
            Text(
              'We\'ve sent a code to your email address ${widget.email}, please put the code here.',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) => PinCode(
                  onChanged: (data) {
                    if (data!.isEmpty) {
                      code[index] = -1;
                    }
                    if (data.length == 1) {
                      code[index] = int.parse(data);
                      if (index < 5) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).unfocus();
                      }
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
            const Spacer(flex: 1),
            (state is LoadingEmailConfirmState)
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      onPressed: isValidCode() ? verify : null,
                      label: 'Verify',
                    ),
                  ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }

  void emailConfirmListener(context, state) async {
    if (state is FailureEmailConfirmState) {
      showCustomSnackBar(title: 'Verify Error', message: state.errMessage);
    }
    if (state is SuccessEmailConfirmState) {
      await BlocProvider.of<ProfileCubit>(context).getProfileData();
      showCustomSnackBar(title: 'Success', message: 'Registered successfully');
    }
  }

  bool isValidCode() {
    return code.every((element) => element >= 0);
  }

  void verify() async {
    String newCode = code.map((e) => e.toString()).join('');
    if (isValidCode()) {
      await BlocProvider.of<EmailConfirmCubit>(context).emailConfirm(
        email: widget.email,
        code: newCode,
      );
    } else {
      showCustomSnackBar(
        title: 'Error',
        message: 'All code fields are required',
      );
    }
  }
}
