import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';
import 'package:partner/app/routes/app_pages.dart';

class StartupController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(1500.milliseconds).then((value) async {
      var _fireUser = Get.find<PhoneAuthService>().fireUser;

      if (_fireUser == null)
        Get.offNamed(Routes.AUTH);
      else {
        await Get.find<Api>().login();

        Placemark? loc = await getLocation();
        Get.log(loc.toJson().toString());

        // DrComm.currentUser =
        await Get.find<ProfileApi>().getProfile().then((value) async {
          if (value == null)
            Get.offNamed(Routes.SIGNUP);
          else {
            await Get.find<SignupApi>().setLocation(loc);
            DrComm.user = value;
            Get.offNamed(Routes.HOME);
          }
        });
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
