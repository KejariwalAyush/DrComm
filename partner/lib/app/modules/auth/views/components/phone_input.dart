import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';

import '../../controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "DrComm",
            style: Get.textTheme.headline1!.copyWith(color: kcWhite),
          ),
          Text(
            "Help Your Patient!",
            style: Get.textTheme.headline3!.copyWith(color: kcWhite),
          ),
          Text(
            "Let's save more life & make world happy.",
            style: Get.textTheme.bodyText2!.copyWith(color: kcWhite),
          ),
          SizedBox(
            height: 20,
          ),
          KTextField(
            isTransparent: true,
            controller: controller.phoneController,
            isOnlyDigit: true,
            hintText: 'Enter Phone Number',
            textLengthLimit: 10,
            isBorderThere: true,
            leading: Container(
              width: 70,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "+91 | ",
                style: Get.textTheme.bodyText1!
                    .copyWith(color: kcWhite, fontSize: 20),
              ),
            ),
          ),
          Obx(() => controller.isPhoneLoading.value
              ? CircularProgressIndicator()
              : KButton(
                  title: 'Get OTP',
                  onPressed: controller.getOTP,
                  fontSize: 20,
                  padding: EdgeInsets.all(18),
                )),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
