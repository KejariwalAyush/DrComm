import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KOutlineButton extends StatelessWidget {
  const KOutlineButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.isTextWhite = true,
    this.borderColor,
    this.textColor,
    this.icon,
    this.bRadius = 25,
  }) : super(key: key);

  final String? title;
  final Function()? onPressed;
  final bool isTextWhite;
  final EdgeInsets padding;
  final Color? borderColor;
  final Color? textColor;
  final Widget? icon;
  final double bRadius;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(bRadius);
    return Material(
      borderRadius: borderRadius,
      elevation: 1,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        child: Container(
          // width: isWidthMax ? double.maxFinite : null,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
                width: 1.0, color: borderColor ?? Get.theme.accentColor),
          ),
          child: Center(
            child: (icon != null && title != null)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      icon!,
                      SizedBox(width: 10),
                      _textWidget(),
                    ],
                  )
                : _textWidget(),
          ),
        ),
      ),
    );
  }

  Center _textWidget() {
    return Center(
      child: Text(
        title!,
        style: isTextWhite
            ? Get.textTheme.button
            : Get.textTheme.button!
                .copyWith(color: textColor ?? Get.theme.accentColor),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
