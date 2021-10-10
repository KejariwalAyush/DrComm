import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data.dart';

class KButton extends StatelessWidget {
  const KButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.leading,
    this.solidColor,
    this.textColor,
    this.bRadius = 50.0,
    this.fontSize = 14,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  final EdgeInsets padding;
  final Widget? leading;
  final Color? solidColor;
  final Color? textColor;
  final double bRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(bRadius);
    return Material(
      borderRadius: borderRadius,
      elevation: 1,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        splashColor: Get.theme.splashColor,
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: solidColor == null ? kcgButton : null,
            color: solidColor,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leading != null) leading!,
                if (leading != null) SizedBox(width: 5),
                Text(
                  title,
                  style: Get.textTheme.button!.copyWith(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
