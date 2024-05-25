import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/image_slider.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/login_sheet.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          // image slider
          ImageSlider(
            images: [
              Assets.nature1,
              Assets.nature2,
              Assets.nature3,
            ],
          ),
          // login form
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: LoginSheet(),
          ),
        ],
      ),
    );
  }
}
