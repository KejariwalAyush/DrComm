import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:partner/app/data/config/colors.dart';
import 'package:partner/app/data/data.dart';
import 'package:partner/app/modules/profile/views/profile_view.dart';
import 'package:velocity_x/velocity_x.dart';

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
              return FutureBuilder<List<DrAppointment>>(
                  future: Get.find<ProfileApi>().getAppoinments(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: CircularProgressIndicator());
                    final List<DrAppointment> apps = snapshot.data!;

                    apps.removeWhere((e) =>
                        e.appointment.appointmentDate.isBefore(DateTime.now()));

                    if (apps.length == 0)
                      return 'No Appoinments'.text.makeCentered();
                    return ListView.builder(
                      itemCount: apps.length,
                      itemBuilder: (context, index) {
                        DrAppointment drapp = apps[index];
                        return AppointmentContainer(drapp: drapp);
                      },
                    );
                  }).py12();
            else if (_.tab.value == 1)
              return FutureBuilder<List<DrAppointment>>(
                  future: Get.find<ProfileApi>().getAppoinments(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: CircularProgressIndicator());
                    final List<DrAppointment> apps = snapshot.data!;
                    apps.removeWhere((e) =>
                        e.appointment.appointmentDate.isAfter(DateTime.now()));
                    if (apps.length == 0)
                      return 'No Appoinments'.text.makeCentered();
                    return ListView.builder(
                      itemCount: apps.length,
                      itemBuilder: (context, index) {
                        DrAppointment drapp = apps[index];
                        return AppointmentContainer(drapp: drapp);
                      },
                    );
                  }).py12();
            else
              return ProfileView();
          },
        ));
  }
}

class AppointmentContainer extends StatelessWidget {
  const AppointmentContainer({
    Key? key,
    required this.drapp,
  }) : super(key: key);

  final DrAppointment drapp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: kcBg,
      ),
      child: Column(
        children: [
          [
            [
              ProfileImageContainer(
                image: NetworkImage(drapp.user.dp),
                size: 55,
                showBorder: true,
              ),
              (drapp.user.name).text.xl3.bold.make(),
            ].column(crossAlignment: CrossAxisAlignment.start),
            Spacer(),
            [
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
              ),
              5.squareBox,
              TimeFormat(drapp.appointment.bookingDate).text.light.make().py8()
            ].column()
          ].row(crossAlignment: CrossAxisAlignment.start),
          [
            drapp.user.phno.text.make(),
            Spacer(),
          ].row(),
          10.squareBox,
          [
            'Booking Date: '.text.make(),
            Spacer(),
            DateFormat('E, dd MMM yyyy')
                .format(drapp.appointment.appointmentDate)
                .text
                .bold
                .make()
          ].row(),
          20.squareBox,
          if (drapp.appointment.appointmentType == 'home')
            'Open Map Link'.text.make().box.makeCentered()
        ],
      ).p16(),
    ).px16().py4().innerShadow();
  }
}
