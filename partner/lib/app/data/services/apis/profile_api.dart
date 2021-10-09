import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';

import 'api_service.dart';

class ProfileApi extends GetxService {
  late Api api;
  Future<ProfileApi> init() async {
    Get.log('$runtimeType ready');
    api = Get.find<Api>();
    return this;
  }

  Future<DrProfile?> getProfile() async {
    final _extUrl = "/doctor/user/getMyProfile";
    DrProfile? x;
    await api.getReq(_extUrl, (resp) => x = DrProfile.fromMap(resp));
    return x;
  }
}
