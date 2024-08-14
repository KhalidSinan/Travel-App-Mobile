import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_state.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/home_page_widgets/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.controller});
  final ScrollController controller;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:
                Image.asset('assets/images/logo.jpg', width: 120, height: 70),
          ),
          BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeFailure) {
                Get.to(
                  () => FailurePage(
                    error: state.failure,
                    onPressed: () {},
                  ),
                );
              }
            },
            child: HomePageBody(controller: widget.controller),
          ),
        ],
      ),
    );
  }
}
