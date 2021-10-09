import 'dart:io';

import 'package:partner/app/data/data.dart';
import '../../controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPhotos extends StatelessWidget {
  const AddPhotos({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SignupController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      initState: (_) {},
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Now add\nyour Indentity",
                      style: Get.textTheme.headline3!.copyWith(color: kcAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ProfileImageContainer(
                      image: _.dpImage == null
                          ? null
                          : FileImage(File(_.dpImage!.path)),
                      showBorder: true,
                      onTap: controller.addDP,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Add your display picture",
                      style: Get.textTheme.bodyText2!.copyWith(color: kcBlack),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: _.addCF,
                        child: Container(
                          width: context.width * 0.85,
                          height: 250,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: context.width * 0.85,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Get.theme.backgroundColor,
                                  image: _.cfImage == null
                                      ? null
                                      : DecorationImage(
                                          image:
                                              FileImage(File(_.cfImage!.path)),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                child: _.cfImage != null
                                    ? null
                                    : Icon(
                                        Icons.add_a_photo_outlined,
                                        color: kcBlack,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Center(
                    child: Text(
                      "Add your certificate image",
                      style: Get.textTheme.bodyText2!.copyWith(color: kcBlack),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : KButton(
                    title: 'Continue',
                    onPressed: controller.addPhotos,
                    fontSize: 20,
                    padding: EdgeInsets.all(15),
                  )),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
