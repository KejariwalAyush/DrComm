import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';

import '../controllers/auth_controller.dart';
import 'components/otp_input.dart';
import 'components/phone_input.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1504813184591-01572f98c85f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, -1.0),
                end: Alignment(0, 1.1),
                colors: [Colors.transparent, kcBlack],
                stops: [0.0, 1.0],
              ),
            ),
            child: PageView.builder(
              itemCount: 2,
              controller: controller.pageController,
              physics: new NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0)
                  return PhoneInput(controller: controller);
                else
                  return OTPInput(controller: controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}
