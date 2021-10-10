import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data.dart';

/// Shows SnackBar with custom msg & `duration` is in milliseconds
showSnackBar(String msg,
        {bool isError = false,
        num duration = 2500,
        bool isDismissible = true,
        Widget? mainButton}) =>
    Get.showSnackbar(GetBar(
      message: msg,
      duration: duration.milliseconds,
      backgroundColor: isError ? Colors.red : kcAccent,
      isDismissible: isDismissible,
      mainButton: mainButton,
    ));
