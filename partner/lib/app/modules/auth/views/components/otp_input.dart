import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';

import '../../controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class OTPInput extends StatelessWidget {
  const OTPInput({
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
            "OTP\nVerification",
            style: Get.textTheme.headline3!.copyWith(color: kcWhite),
          ),
          Row(
            children: [
              Text(
                "We've sent OTP to ${controller.phoneController.text}. ",
                style: Get.textTheme.bodyText2!.copyWith(color: kcWhite),
              ),
              GestureDetector(
                onTap: controller.changeNumber,
                child: Text(
                  "Edit Number",
                  style: Get.textTheme.bodyText2!.copyWith(color: kcAccent),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          KTextField(
            isTransparent: true,
            isBorderThere: true,
            isPassword: true,
            width: Get.width,
            controller: controller.otpController,
            isCenter: true,
            isOnlyDigit: true,
            hintText: '******',
            fontSize: 20,
            textLengthLimit: 6,
          ),
          Obx(() => controller.isOtploading.value
              ? CircularProgressIndicator()
              : KButton(
                  title: 'Continue',
                  onPressed: controller.confirmOTP,
                  fontSize: 20,
                  padding: EdgeInsets.all(18),
                )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Didn't recive OTP yet? ",
                style: Get.textTheme.bodyText2!.copyWith(color: kcWhite),
              ),
              Obx(() => Visibility(
                    visible: controller.expired.value,
                    child: GestureDetector(
                      onTap: controller.resendOTP,
                      child: Text(
                        "Resend OTP",
                        style:
                            Get.textTheme.bodyText2!.copyWith(color: kcAccent),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => Visibility(
                visible: !controller.expired.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Resend OTP in ",
                      style:
                          Get.textTheme.bodyText2!.copyWith(color: kcGeryIcon),
                    ),
                    Countdown(
                      seconds: 60,
                      onFinish: () => controller.expired.toggle(),
                      textStyle:
                          Get.textTheme.bodyText2!.copyWith(color: kcGeryIcon),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
