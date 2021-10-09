import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:partner/app/data/config/colors.dart';
import 'package:partner/app/modules/profile/views/profile_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.history, title: "History"),
            TabData(iconData: Icons.person, title: "Profile")
          ],
          inactiveIconColor: kcAccent,
          circleColor: kcAccent,
          barBackgroundColor: kcBg,
          onTabChangedListener: controller.changeTab,
        ),
        body: GetBuilder<HomeController>(
          builder: (_) {
            if (_.tab.value == 0)
              return Center(
                child: Text(
                  'HomeView is working',
                  style: TextStyle(fontSize: 20),
                ),
              );
            else if (_.tab.value == 1)
              return Center(
                child: Text(
                  'HomeView is working',
                  style: TextStyle(fontSize: 20),
                ),
              );
            else
              return ProfileView();
          },
        ));
  }
}
