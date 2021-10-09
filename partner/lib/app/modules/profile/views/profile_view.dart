import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBg,
      body: Column(
        children: [
          45.squareBox,
          Row(
            children: [
              ProfileImageContainer(
                image: NetworkImage(DrComm.user!.dp),
                showBorder: true,
                bottomCornerWidget: InkWell(
                    onTap: () {},
                    child: Icon(Icons.edit, size: 10, color: kcWhite).p8()),
              ),
              30.squareBox,
              Expanded(
                child: [
                  'Dr. ${DrComm.user!.name}'.text.xl3.make(),
                  '${DrComm.user!.phno}'.text.lg.make(),
                  '${getGenderString(DrComm.user!.gender).capitalizeFirst}'
                      .text
                      .lg
                      .gray400
                      .make(),
                  10.squareBox,
                  if (DrComm.user!.rating != 0.0)
                    '⭐ ${DrComm.user!.rating.toDoubleStringAsFixed(digit: 2)} ratings'
                        .text
                        .lg
                        .make()
                  else
                    '⭐ No ratings'.text.lg.make(),
                ].column(crossAlignment: CrossAxisAlignment.start),
              ),
            ],
          ).px24(),
          30.squareBox,
          FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                return TitleNContent(
                  title: 'Overall Stats',
                  child: Container(
                    child: [
                      ['30'.text.xl3.bold.make(), 'Patients'.text.xl.make()]
                          .column(),
                      50.squareBox,
                      ['50'.text.xl3.bold.make(), 'Home Visits'.text.xl.make()]
                          .column(),
                    ].row().py16(),
                  ),
                );
              }),
          30.squareBox,
          KListTile(
            title: 'Are you available now?',
            trailing: Switch.adaptive(value: true, onChanged: (val) {}),
          ),
          10.squareBox,
          KListTile(
            title: 'Can you visit patients for now?',
            trailing: Switch.adaptive(value: false, onChanged: (val) {}),
          ),
          10.squareBox,
          KButton(
            solidColor: Colors.redAccent,
            textColor: kcWhite,
            title: 'Logout',
            onPressed: () => Get.find<PhoneAuthService>().signOut(),
            leading: Icon(
              Icons.logout,
              color: kcWhite,
            ),
          ).px24(),
        ],
      ),
    );
  }
}
