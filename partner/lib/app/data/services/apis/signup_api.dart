import 'dart:convert';
import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../data.dart';
import 'api_service.dart';

class SignupApi extends GetxService {
  late Api api;
  Future<SignupApi> init() async {
    Get.log('$runtimeType ready');
    api = Get.find<Api>();
    return this;
  }

  Future getProfile() async {
    final _extUrl = '/doctor/user/getProfile';
    await api.getReq(_extUrl, (resp) {});
  }

  Future<String?> getDP() async {
    final _extUrl = '/doctor/user/getDP';
    String? dp;
    await api.getReq(_extUrl, (resp) {
      dp = resp;
    });
    return dp;
  }

  Future setDP(File dp) async {
    final _extUrl = '/doctor/user/uploadDp';
    await api.uploadImage(_extUrl, 'dp', dp);
  }

  Future setCF(File cf) async {
    final _extUrl = '/doctor/user/uploadCertificate';
    await api.uploadImage(_extUrl, 'certificate', cf);
  }

  Future setLocation(Placemark loc) async {
    final _extUrl = '/doctor/user/setLocation';
    final Map<String, dynamic> body = loc.toJson();
    Get.log("Sent Body: ${jsonEncode(body)}");
    await api.postReq(_extUrl, body, (resp) {});
  }

  ///
  Future signUp(
      String name, String phno, String specialization, Gender gender) async {
    final _extUrl = '/doctor/user/signup';
    Map<String, String> body = {
      'name': name,
      'phno': phno,
      'specialization': specialization,
      'gender': getGenderString(gender).toLowerCase(),
      'notificationToken': api.fcm.fcmToken ?? ''
    };
    Get.log("Sent Body: ${jsonEncode(body)}");
    await api.postReq(_extUrl, body, (resp) {});
  }
}
