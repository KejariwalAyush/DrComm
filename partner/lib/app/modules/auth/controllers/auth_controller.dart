import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';

class AuthController extends GetxController {
  final PageController pageController = new PageController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController otpController = new TextEditingController();
  RxBool expired = false.obs;
  final _phoneAuth = Get.find<PhoneAuthService>();
  var VerificationId;

  RxBool isPhoneLoading = false.obs, isOtploading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getOTP() async {
    if (phoneController.text != "" && phoneController.text.length == 10) {
      isPhoneLoading.toggle();
      FocusScope.of(Get.context!).requestFocus(FocusNode());

      final phoneNum = '+91 ' + phoneController.text;
      await _phoneAuth.verifyPhone(
          phoneNumber: phoneNum,
          onSmsSent: (String verId) {
            VerificationId = verId;
            showSnackBar('OTP Sent to ' + phoneNum);
            pageController.nextPage(
                duration: 300.milliseconds, curve: Curves.decelerate);
          });
      isPhoneLoading.toggle();
    } else
      showSnackBar('Invalid Phone Number', isError: true);
  }

  void confirmOTP() {
    if (otpController.text != "" && otpController.text.length == 6) {
      isOtploading.toggle();
      FocusScope.of(Get.context!).requestFocus(FocusNode());

      _phoneAuth.signInWithOTP(otpController.text, VerificationId);
      isOtploading.toggle();
    } else
      showSnackBar('Invalid OTP', isError: true);
  }

  void changeNumber() => pageController.previousPage(
      duration: 300.milliseconds, curve: Curves.decelerate);

  void resendOTP() => expired.toggle();
}
