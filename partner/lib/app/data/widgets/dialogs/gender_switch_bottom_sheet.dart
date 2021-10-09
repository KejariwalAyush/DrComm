import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data.dart';
import 'bottom_dialog_container.dart';

class KGenderSwitchBottomSheet extends StatelessWidget {
  const KGenderSwitchBottomSheet(
      {Key? key,
      required this.rxGender,
      required this.onChanged,
      required this.onTap})
      : super(key: key);
  final Rx<Gender> rxGender;
  final Function(Gender? gender) onChanged;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return KBottomDialogContainer(
      height: 220,
      elevation: 0.0,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Select Gender',
            style: Get.textTheme.headline5!.copyWith(fontSize: 26),
          ),
          for (var gender in Gender.values)
            Obx(() => RadioListTile<Gender>(
                value: gender,
                groupValue: rxGender.value,
                toggleable: true,
                title: Text(
                  getGenderString(gender),
                  style: Get.textTheme.bodyText2!.copyWith(fontSize: 17),
                ),
                activeColor: Get.theme.accentColor,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: onChanged)),
        ],
      ),
    );
  }
}
