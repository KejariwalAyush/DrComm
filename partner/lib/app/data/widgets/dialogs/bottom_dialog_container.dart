import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KBottomDialogContainer extends StatelessWidget {
  const KBottomDialogContainer(
      {Key? key,
      required this.child,
      this.height,
      this.elevation = 10.0,
      required this.onTap})
      : super(key: key);
  final Widget child;
  final double? height;
  final double elevation;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: elevation,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: Get.width,
              height: Get.height,
              alignment: Alignment.center,
              color: Colors.transparent,
            ),
          ),
          Container(
              height: height ?? Get.height * 0.5,
              width: Get.width,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.white,
              ),
              child: child),
        ],
      ),
    );
  }
}
