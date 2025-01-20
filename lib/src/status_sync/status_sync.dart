import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/src/status_sync/status_box/status_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'status_sync_controller.dart';

class StatusSyncBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusSyncController>(() => StatusSyncController());
  }
}

class StatusSyncPage extends GetView<StatusSyncController> {
  const StatusSyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('魔方同步'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: controller.reset,
              child: Text(
                '重置',
                style: Get.textTheme.labelLarge,
              ))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(child: _cube()),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _rotateButton(Icons.swipe_left, controller.turnLeft),
              _rotateButton(Icons.swipe_vertical, controller.turnUpDown),
              _rotateButton(Icons.swipe_right, controller.turnRight)
            ],
          ),
          const SizedBox(height: 40),
          Obx(() => Text(controller.isCompleted ? '所有颜色已填充完毕' : controller.tips.value)),
          const SizedBox(height: 10),
          _selectColorItems(),
          const SizedBox(height: 40),
          Obx(() => controller.isCompleted
              ? ElevatedButton(
                  onPressed: controller.sync,
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                  child: const Text('同步完成'),
                )
              : ElevatedButton(
                  onPressed: controller.solved,
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                  child: const Text('六面复原'),
                )),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _cube() {
    return AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, _) {
          return ZIllustration(zoom: 1.5, children: [
            ZPositioned(
              rotate: ZVector(
                  controller.rotateXAnimation?.value, controller.rotateYAnimation?.value, 0),
              child: ZGroup(
                children: [
                  ZPositioned(
                    child: ZHemisphere(diameter: boxOffset * 3, color: Colors.black),
                  ),
                  ZPositioned(
                    rotate: const ZVector.only(y: tau / 2),
                    child: ZHemisphere(diameter: boxOffset * 3, color: Colors.black),
                  ),
                  ZGroup(children: controller.boxs.map((e) => StatusBox(boxModel: e)).toList()),
                ],
              ),
            )
          ]);
        });
  }

  Widget _rotateButton(IconData iconData, VoidCallback onPressed) {
    return IconButton(
      iconSize: 60,
      icon: Icon(iconData),
      onPressed: onPressed,
    );
  }

  Widget _selectColorItems() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => CupertinoSlidingSegmentedControl<ColorModel>(
          backgroundColor: CupertinoColors.systemGrey4,
          thumbColor: const Color(0xff007ba7),
          groupValue: controller.selectedSegment.value,
          onValueChanged: controller.onColorChanged,
          children: controller.colorItems)),
    );
  }
}
