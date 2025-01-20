import 'dart:ui';

import 'package:cubestation_flutter/cube/cube.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'timing_play_controller.dart';

class TimingPlayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimingPlayController>(() => TimingPlayController());
  }
}

class TimingPlayPage extends GetView<TimingPlayController> {
  const TimingPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: controller.onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text(controller.type == 0 ? '计时排位赛' : '计时练习'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Obx(() => Text(
                      controller.showText.value,
                      style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFeatures: [FontFeature.tabularFigures()]),
                    )),
                const SizedBox(height: 16),
                Obx(() => Offstage(
                    offstage: !controller.showText.value.startsWith('打乱中'),
                    child: const Text('朝向：白顶绿前'))),
                Obx(() => Offstage(
                    offstage: !controller.showText.value.startsWith('观察中'),
                    child: const Text('转动魔方，立即开始'))),
                Expanded(child: Obx(() => Cube(static: controller.isScrambling.value))),
                Obx(() => Text(
                      controller.scrambleController.showSequence.join(' '),
                      style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ));
  }
}
