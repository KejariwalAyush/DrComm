import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.isCenter = false,
    this.textLengthLimit,
    this.isOnlyDigit = false,
    this.validator,
    this.isReadOnly = false,
    this.isTransparent = false,
    this.maxLines = 1,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.width,
    this.trailing,
    this.leading,
    this.fontSize = 20,
    this.borderRadius = 50,
    this.onTap,
    this.isBorderThere = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool isCenter;
  final int? textLengthLimit;
  final bool isOnlyDigit;
  final Function(String value)? validator;
  final bool isReadOnly;
  final int maxLines;
  final double? width;
  final Widget? trailing;
  final Widget? leading;
  final bool isTransparent;
  final bool isPassword;
  final TextInputType textInputType;
  final double fontSize;
  final Function()? onTap;
  final double borderRadius;
  final bool isBorderThere;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
      alignment: Alignment.center,
      width: width ?? Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(maxLines > 2 ? 25 : borderRadius),
        border: isBorderThere
            ? isTransparent
                ? Border.all(
                    color: kcWhite,
                  )
                : Border.all(
                    color: kcBlack,
                  )
            : null,
        color: isTransparent ? Colors.transparent : Get.theme.cardColor,
      ),
      child: TextFormField(
        key: key,
        controller: controller,
        maxLines: maxLines,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlign: isCenter ? TextAlign.center : TextAlign.start,
        textCapitalization: maxLines > 1
            ? TextCapitalization.sentences
            : TextCapitalization.words,
        inputFormatters: [
          if (textLengthLimit != null)
            LengthLimitingTextInputFormatter(textLengthLimit),
          if (isOnlyDigit) FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) => (value.length == textLengthLimit)
            ? FocusScope.of(context).nextFocus()
            : null,
        style: Get.textTheme.bodyText2!.copyWith(
            color: isTransparent ? kcWhite : kcBlack, fontSize: fontSize),
        decoration: InputDecoration(
          hintText: hintText ?? null,
          labelText: labelText ?? null,
          hintStyle: Get.textTheme.bodyText2!
              .copyWith(color: kcLightGrey, fontSize: fontSize),
          labelStyle: Get.textTheme.bodyText2!
              .copyWith(color: isTransparent ? kcWhite : kcBlack),
          errorStyle:
              Get.textTheme.bodyText2!.copyWith(color: Colors.redAccent),
          enabled: !isReadOnly,
          // filled: false,
          border: InputBorder.none,
          suffixIcon: trailing ?? null,
          prefixIcon: leading ?? null,
        ),
        keyboardType: isOnlyDigit ? TextInputType.phone : textInputType,
        obscureText: isPassword,
        validator: validator as String? Function(String?)? ??
            (value) {
              if (value == null) return 'Can\'t be null';
              if (textLengthLimit != null && value.length < textLengthLimit!)
                return 'Can\'t be less than $textLengthLimit';
              return null;
            },
        onTap: onTap,
      ),
    );
  }
}
