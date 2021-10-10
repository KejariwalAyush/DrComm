import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data.dart';

class KMoreOptionSheet extends StatelessWidget {
  const KMoreOptionSheet({
    Key? key,
    required this.tiles,
  }) : super(key: key);

  final List<SheetOptionTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: Get.width,
      height: tiles.length * 60,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var tile in tiles)
            Column(
              children: [
                InkWell(
                  onTap: tile.onTap,
                  child: Center(
                    child: Text(
                      tile.title,
                      style: tile.isDanger
                          ? Get.textTheme.bodyText2!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent)
                          : Get.textTheme.bodyText2!.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                if (tile != tiles.last)
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Divider(
                      thickness: 1,
                      color: kcGrey,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class SheetOptionTile {
  final Function() onTap;
  final String title;
  final bool isDanger;

  SheetOptionTile(this.onTap, this.title, [this.isDanger = false]);
}
