import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partner/app/data/data.dart';
import 'package:partner/app/routes/app_pages.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  late SignupApi api;
  final PageController pageController = new PageController();

  @override
  void onInit() async {
    await Get.putAsync(() => SignupApi().init());
    api = Get.find<SignupApi>();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (Get.arguments != null) nextPage();
  }

  @override
  void onClose() {}

  nextPage() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    pageController.nextPage(
        duration: 300.milliseconds, curve: Curves.decelerate);
  }

  prevPage() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    pageController.previousPage(
        duration: 300.milliseconds, curve: Curves.decelerate);
  }

  /// Basic data page controllers
  final nameController = new TextEditingController();
  final specializationController = new TextEditingController();

  logout() => Get.find<PhoneAuthService>().signOut();

  Rx<Gender> myGender = Gender.MALE.obs;
  String? dob;

  void onGenderChangeCallback() => Get.bottomSheet(KGenderSwitchBottomSheet(
        rxGender: myGender,
        onChanged: (value) {
          if (value != null) {
            myGender.value = value;
            myGender.refresh();
          }
          Get.back();
        },
        onTap: () {},
      ));

  addBasicData() async {
    await getLocation();
    final String? _name = nameController.text;
    final String? _sp = specializationController.text;
    if (_name == null || _name.length < 5)
      showSnackBar("Name can't be null or less than 5 chars", isError: true);
    else if (_sp == null || _sp.length < 5)
      showSnackBar("Specialization can't be null or less than 5 chars",
          isError: true);
    else {
      acceptContinue();
    }
  }

  acceptContinue() async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    isLoading.toggle();
    Get.back();
    await api.signUp(
        nameController.text,
        FirebaseAuth.instance.currentUser!.phoneNumber!,
        specializationController.text,
        myGender.value);
    nextPage();
    isLoading.toggle();
  }

  /// Add Photos
  final ImagePicker _picker = ImagePicker();
  XFile? dpImage;
  XFile? cfImage;

  addDP() async {
    dpImage = await _picker.pickImage(source: ImageSource.gallery);
    update();
  }

  addCF() async {
    cfImage = await _picker.pickImage(source: ImageSource.gallery);
    update();
  }

  addPhotos() async {
    isLoading.toggle();
    if (dpImage != null && cfImage != null) {
      Get.log(dpImage!.path.toString());
      Get.log(cfImage!.path.toString());

      await api.setDP(File(dpImage!.path));
      await api.setCF(File(cfImage!.path));
    } else {
      showSnackBar("Display pic & Certificate are required", isError: true);
    }

    DrComm.user = await Get.find<ProfileApi>().getProfile();
    Get.offAllNamed(Routes.HOME);
    isLoading.toggle();
  }
}
