import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:partner/app/data/data.dart';
import 'package:partner/app/modules/startup/controllers/startup_controller.dart';

class StartUpView extends GetView<StartupController> {
  @override
  Widget build(BuildContext context) {
    if (!controller.initialized) new StartupController();
    return Scaffold(
      backgroundColor: kcAccent,
      body: Container(
        height: Get.height,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'DrComm',
                  style: Get.textTheme.headline1!.copyWith(color: kcWhite),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 50,
                  child: Center(child: CircularProgressIndicator()),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
