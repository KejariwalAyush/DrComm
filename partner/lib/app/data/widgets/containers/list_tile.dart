import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data.dart';

class KListTile extends StatelessWidget {
  const KListTile({
    Key? key,
    this.leading,
    this.trailing,
    this.title,
    this.subtitle,
    this.color,
    this.time,
    this.onTap,
    this.titleStyle,
    this.child,
    this.hasBorder = false,
    this.subtitleStyle,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trailing;
  final String? title;
  final String? subtitle;
  final Color? color;
  final DateTime? time;
  final Function()? onTap;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? child;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: color ?? Get.theme.cardColor,
          border: hasBorder ? Border.all() : null,
        ),
        child: child ??
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leading != null) leading!,
                // if (leading != null)
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        Text(title!,
                            style: titleStyle ??
                                Get.textTheme.headline6!
                                    .copyWith(fontSize: 20)),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: subtitleStyle ??
                              (title == null
                                  ? Get.textTheme.headline6!
                                      .copyWith(fontSize: 16)
                                  : Get.textTheme.bodyText2!
                                      .copyWith(color: Get.theme.focusColor)),
                          maxLines: 2,
                        ),
                      if (time != null)
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(TimeFormat(time!),
                                  style: Get.textTheme.caption)),
                        ),
                    ],
                  ),
                ),
                if (trailing != null) trailing!
              ],
            ),
      ),
    );
  }
}
