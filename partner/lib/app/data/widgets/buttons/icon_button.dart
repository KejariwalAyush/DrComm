import 'package:flutter/material.dart';

import '../../data.dart';

class KIconButton extends StatelessWidget {
  const KIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.roundness = 16.0,
    this.color = kcAccent,
  }) : super(key: key);

  final Widget icon;
  final void Function() onPressed;
  final double roundness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(roundness), color: color,
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color(0x291466cc),
          //     offset: Offset(0, 15),
          //     blurRadius: 30,
          //   ),
          // ],
        ),
        child: Center(child: icon),
      ),
    );
  }
}
