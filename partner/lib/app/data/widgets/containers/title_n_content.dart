import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleNContent extends StatelessWidget {
  const TitleNContent({
    Key? key,
    this.titleIcon,
    required this.title,
    this.child,
    this.trailing,
    this.titleColor = Colors.black,
    this.fontSize = 20,
    this.isBold = true,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 15),
  }) : super(key: key);

  final Widget? titleIcon;
  final String title;
  final Color titleColor;
  final Widget? child;
  final Widget? trailing;
  final double fontSize;
  final bool isBold;
  final EdgeInsets titlePadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: titlePadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (titleIcon != null) titleIcon!,
                    if (titleIcon != null)
                      SizedBox(
                        width: 10,
                      ),
                    Text(
                      title,
                      style: Get.textTheme.headline6!.copyWith(
                          color: titleColor,
                          fontSize: fontSize,
                          fontWeight:
                              isBold ? FontWeight.w700 : FontWeight.normal),
                    ),
                  ],
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
          if (child != null)
            SizedBox(
              height: fontSize / 2,
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
