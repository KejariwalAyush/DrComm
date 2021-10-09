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
          Row(
            children: [
              ProfileImageContainer(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGRvY3RvcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
              [
                'Dr. Username'.text.xl3.make(),
              ].column(crossAlignment: CrossAxisAlignment.start),
            ],
          ),
        ],
      ),
    );
  }
}
