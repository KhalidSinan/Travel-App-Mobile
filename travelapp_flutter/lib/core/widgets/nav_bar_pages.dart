import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/home/presentation/views/home_page.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/home_page_widgets/custom_nav_bar.dart';

class NavBarPages extends StatefulWidget {
  const NavBarPages({super.key, this.initIndex});

 final int ?initIndex;
  @override
  State<NavBarPages> createState() => _NavBarPagesState();
}

class _NavBarPagesState extends State<NavBarPages>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  late TabController tabController;

  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 5, vsync: this, initialIndex: widget.initIndex ?? 0);
    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (isVisible) {
            setState(() {
              isVisible = false;
            });
          }
        } else {
          if (!isVisible) {
            setState(() {
              isVisible = true;
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void navigatForNotification() {
    Get.to(() => HomePage(controller: scrollController));
  }

  @override
  Widget build(BuildContext context) {
    //  TabController tabController = TabController(length: 5, vsync: this ,);
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: [
              HomePage(controller: scrollController),
              const CustomLoading(),
              Container(),
              Container(),
              Container()
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomNavBar(
              isVisible: isVisible,
              tabController: tabController,
            ),
          )
        ],
      ),
    );
  }
}
