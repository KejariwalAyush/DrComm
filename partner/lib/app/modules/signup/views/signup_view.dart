import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';

import '../controllers/signup_controller.dart';
import 'components/add_photos.dart';
import 'components/basic_Info.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    final signUpList = [
      BasicInfo(controller: controller),
      AddPhotos(controller: controller),
    ];
    return Scaffold(
      backgroundColor: kcBg,
      body: WillPopScope(
        onWillPop: () => showSnackBar('Progress will be gone!',
            isError: true,
            mainButton: InkWell(
                onTap: () => exit(0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('Exit'),
                ))),
        child: Container(
          padding: EdgeInsets.fromLTRB(18, Get.mediaQuery.padding.top, 18, 0),
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: signUpList.length,
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => signUpList[index],
          ),
        ),
      ),
    );
  }
}
