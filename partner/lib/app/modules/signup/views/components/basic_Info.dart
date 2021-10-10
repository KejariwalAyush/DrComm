import 'package:partner/app/data/data.dart';

import '../../controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SignupController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Text(
                      "DrComm",
                      style: Get.textTheme.headline6!.copyWith(color: kcAccent),
                    ),
                  )),
              Center(
                child: Text(
                  "Welcome\nto our Family",
                  style: Get.textTheme.headline3!.copyWith(color: kcAccent),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              TitleNContent(
                title: 'Full Name',
                isBold: false,
                child: KTextField(
                  hintText: 'Enter Full Name',
                  controller: controller.nameController,
                  isBorderThere: true,
                  textInputType: TextInputType.name,
                ),
              ),
              TitleNContent(
                isBold: false,
                title: 'Gender',
                child: Obx(() => GestureDetector(
                      onTap: controller.onGenderChangeCallback,
                      child: KTextField(
                        isReadOnly: true,
                        isBorderThere: true,
                        controller: new TextEditingController(
                            text: getGenderString(controller.myGender.value)),
                        trailing: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 30,
                          color: Get.theme.focusColor,
                        ),
                      ),
                    )),
              ),
              TitleNContent(
                title: 'Specialization',
                isBold: false,
                child: KTextField(
                  hintText: 'Enter Specialization',
                  controller: controller.specializationController,
                  isBorderThere: true,
                  textInputType: TextInputType.name,
                ),
              ),
            ],
          )),
        ),
        const SizedBox(height: 10),
        Obx(() => controller.isLoading.value
            ? CircularProgressIndicator()
            : Column(
                children: [
                  KButton(
                    title: 'Continue',
                    onPressed: controller.addBasicData,
                    fontSize: 20,
                    padding: EdgeInsets.all(15),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      GestureDetector(
                          onTap: controller.logout,
                          child: Text(
                            "Logout",
                            style: Get.textTheme.bodyText2!
                                .copyWith(color: kcAccent),
                          )),
                    ],
                  )
                ],
              )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
