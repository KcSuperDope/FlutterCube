import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrientationDialog extends StatelessWidget {
  final VoidCallback? onTapStart;
  const OrientationDialog({Key? key, this.onTapStart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: 500,
            width: 400,
            decoration:
                BoxDecoration(color: CSColors.auxiliary, borderRadius: BorderRadius.circular(16)),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Padding(padding: const EdgeInsets.all(16.0), child: _orientation()),
                Padding(
                    padding: const EdgeInsets.only(right: 8, top: 8),
                    child: IconButton(
                      onPressed: () {
                        if (onTapStart != null) {
                          onTapStart!();
                        }
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
                      iconSize: 30,
                      alignment: Alignment.topRight,
                    ))
              ],
            ),
          ),
        ));
  }

  Widget _orientation() {
    return Center(
      child: Column(
        children: [
          const Text(
            '魔方朝向摆放',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
              child: Image.asset(
            'assets/teach_orientation.png',
            width: 260,
            height: 260,
          )),
          const SizedBox(height: 30),
          ButtonUtils.filledButton(
              onPressed: () {
                if (onTapStart != null) {
                  onTapStart!();
                }
                Get.back();
              },
              textStyle: TextStyle(color: CSColors.auxiliary)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
