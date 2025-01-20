import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/main.dart';
import 'package:cubestation_flutter/src/color_solution/color_box/color_box.dart';
import 'package:cubestation_flutter/src/color_solution/orientation_check/orientation_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'color_controller.dart';

class ColorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ColorController>(() => ColorController());
  }
}

class ColorPage extends GetView<ColorController> {
  const ColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => appOrientation.value == Orientation.landscape ? _landscape() : _portrait());
  }

  Widget _portrait() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('填色复原'),
        centerTitle: true,
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
          SizedBox(
            height: 50,
            child: Obx(() => Offstage(
                  offstage: !controller.isCompleted,
                  child: ElevatedButton(
                    onPressed: controller.sync,
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                    child: const Text('魔方求解'),
                  ),
                )),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _landscape() {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(height: double.infinity, width: Get.width * 0.4, child: _cube()),
          Column(
            children: [
              const SizedBox(height: 60),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _rotateButton(Icons.swipe_left, controller.turnLeft),
                          const SizedBox(width: 36),
                          _rotateButton(Icons.swipe_vertical, controller.turnUpDown),
                          const SizedBox(width: 36),
                          _rotateButton(Icons.swipe_right, controller.turnRight)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Obx(() => Text(controller.isCompleted ? '所有颜色已填充完毕' : controller.tips.value)),
              _selectColorItems(),
              const SizedBox(height: 6),
              SizedBox(
                height: 50,
                child: Obx(() => Offstage(
                      offstage: !controller.isCompleted,
                      child: ElevatedButton(
                        onPressed: controller.sync,
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                        child: const Text('魔方求解'),
                      ),
                    )),
              ),
            ],
          ),
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
                  ZGroup(children: controller.boxs.map((e) => ColorBox(boxModel: e)).toList()),
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
