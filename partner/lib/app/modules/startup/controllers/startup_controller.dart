import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';
import 'package:partner/app/routes/app_pages.dart';

class StartupController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(500.milliseconds).then((value) async {
      var _fireUser = Get.find<PhoneAuthService>().fireUser;

      if (_fireUser == null)
        Get.offNamed(Routes.AUTH);
      else {
        // Get.offNamed(Routes.AUTH);
        Get.offNamed(Routes.HOME);
        // await Get.find<Api>().login();
        // DrComm.currentUser =
        //     await Get.find<ProfileApi>().getCurrentUserProfile();

        // if (DrComm.currentUser == null)
        //   Get.offNamed(Routes.SIGNUP);
        // !uncomment this when photos is setup
        // else if (Congle.currentUser!.photos == null ||
        //     Congle.currentUser!.photos!.length < 3)
        //   Get.offNamed(Routes.SIGNUP, arguments: 2);
        // else {
        //   LocationData? loc = await getLocation();
        //   if (loc == null)
        //     Get.off(() => LocationPermissionPage(onLocationGet: (location) {
        //           if (location != null) loc = location;
        //         }));
        //   await Get.find<SignupApi>().setLocation(loc!);
        //   Get.offNamed(Routes.HOME);
        // }
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
