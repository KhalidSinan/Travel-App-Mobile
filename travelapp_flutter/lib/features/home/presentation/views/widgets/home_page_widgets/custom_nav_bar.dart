import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar(
      {super.key, required this.isVisible, required this.tabController});
  final bool isVisible;
  final TabController tabController;
  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(  
      height: widget.isVisible ? 70 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Wrap(
        children: [
          BottomBar(   
            start: 20,
            width: MediaQuery.of(context).size.width,
            barColor: Colors.transparent,
            barAlignment: Alignment.bottomCenter,
            barDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [BoxShadow(color: Colors.grey[300]!)],
              gradient: RadialGradient(
                radius: 12,
                colors: [Themes.primary, Themes.primary.withOpacity(0.1)],
              ),
            ),
            body: (context, controller) => const SizedBox(),
            child: TabBar(
              dividerHeight: 0,
              controller: widget.tabController,
              splashBorderRadius: BorderRadius.circular(40),
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: const EdgeInsets.only(bottom: 5, top: 42),
              indicator: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [BoxShadow(color: Colors.black)]),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              overlayColor:
                  MaterialStatePropertyAll(Colors.white.withOpacity(0.1)),
              tabs: const [
                Tab(
                  iconMargin: EdgeInsets.zero,
                  icon: Icon(
                    Icons.home_rounded,
                    size: 32,
                  ),
                ),
                Tab(
                  iconMargin: EdgeInsets.zero,
                  icon: Icon(
                    FontAwesomeIcons.earthAmericas,
                    size: 26,
                  ),
                ),
                Tab(
                  iconMargin: EdgeInsets.zero,
                  icon: Icon(
                    FontAwesomeIcons.solidComment,
                    size: 26,
                  ),
                ),
                Tab(
                  iconMargin: EdgeInsets.zero,
                  icon: Icon(
                    Icons.notifications_rounded,
                    size: 32,
                  ),
                ),
                Tab(
                  iconMargin: EdgeInsets.zero,
                  icon: Icon(
                    Icons.settings_rounded,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
