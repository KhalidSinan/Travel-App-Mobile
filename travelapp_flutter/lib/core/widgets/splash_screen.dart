import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/login_page.dart';
import 'package:travelapp_flutter/features/on_baoarding/presentation/views/onBoarding_screen.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
  }

  Future<void> initializeController() async {
    _controller = VideoPlayerController.asset('assets/videos/journeyjoy.mp4')
      ..initialize().then(
        (_) {
          setState(
            () {
              _controller.play();
            },
          );
        },
      ).whenComplete(() => Get.off(() => const OnBoarding()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: initializeController(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
