import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data.dart';

class ProfileImageContainer extends StatelessWidget {
  const ProfileImageContainer({
    Key? key,
    required this.image,
    this.bottomCornerWidget,
    this.size = 100,
    this.showBorder = false,
    this.onTap,
    this.borderRadius,
  }) : super(key: key);

  final double size;
  final ImageProvider<Object>? image;
  final Widget? bottomCornerWidget;
  final bool showBorder;
  final Function()? onTap;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: !showBorder ? size * 0.85 : size * 0.70,
              height: !showBorder ? size * 0.85 : size * 0.70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    borderRadius ?? (!showBorder ? size * 0.28 : size * 0.18)),
                color: Get.theme.backgroundColor,
                image: image == null
                    ? null
                    : DecorationImage(
                        image: image!,
                        fit: BoxFit.cover,
                      ),
              ),
              child: image != null
                  ? null
                  : Icon(
                      Icons.add_a_photo_outlined,
                      color: kcBlack,
                    ),
            ),
            if (showBorder)
              Container(
                width: size * 0.85,
                height: size * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(borderRadius ?? size * 0.25)),
                  border: Border.all(
                      width: 3.0,
                      color: Get.theme.accentColor.withOpacity(0.5)),
                ),
              ),
            if (bottomCornerWidget != null)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    height: size * 0.30,
                    width: size * 0.30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Get.theme.accentColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(borderRadius ?? size * 0.60)),
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),
                    child: bottomCornerWidget),
              ),
          ],
        ),
      ),
    );
  }
}
