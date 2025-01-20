import 'dart:ui';

import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/src/replay/replay_controller.dart';
import 'package:cubestation_flutter/src/replay/replay_cube/replay_cube.dart';
import 'package:cubestation_flutter/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReplayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReplayController>(() => ReplayController());
  }
}

class ReplayPage extends GetView<ReplayController> {
  const ReplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('复盘播放'),
        centerTitle: true,
      ),
      body: _content(),
      floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: ButtonUtils.iconButton(
              text: '步骤明细',
              icon: 'icon_battle',
              iconSize: 24,
              width: Get.width * 0.35,
              onPressed: controller.stepsDetail)),
    );
  }

  Widget _content() {
    return Column(
      children: [
        Container(
          color: CSColors.divider,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.35, child: ReplayCube(record: controller.record)),
              Obx(() => Text(
                    TimeUtils.formatTime(controller.ticks.value),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFeatures: [FontFeature.tabularFigures()]),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Obx(() => Slider(
                      value: controller.ticks.value / controller.record.useTime!,
                      onChanged: (value) {
                        print("onChanged : $value");
                        controller.ticks.value = (controller.record.useTime! * value).round();
                        print("controller.showTime.value : ${controller.ticks.value}");
                      },
                      onChangeStart: (value) {
                        print("onChangeStart : $value");
                        // controller.sliderValue.value = value;
                      },
                      onChangeEnd: (value) {
                        print("onChangeEnd : $value");
                        // controller.sliderValue.value = value;
                      },
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.fast_rewind_rounded,
                        size: 60,
                      )),
                  Obx(() => controller.playing.value
                      ? IconButton(
                          onPressed: controller.pause,
                          icon: Icon(
                            Icons.pause,
                            size: 60,
                          ))
                      : IconButton(
                          onPressed: controller.started,
                          icon: Icon(
                            Icons.play_arrow_rounded,
                            size: 60,
                          ))),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.fast_forward_rounded,
                        size: 60,
                      ))
                ],
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "R' U2 L U2 R2 RU",
            style:
                TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: CSColors.secondaryText),
          ),
        ),
        _changeStepView(3)
        //const SizedBox(height: 16),
      ],
    );
  }

  Widget _changeStepView(int length) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => TextButton(
              onPressed:
                  controller.currentStep.value == 0 ? null : () => controller.currentStep.value--,
              child: const Text('上一步'),
            ),
          ),
          Obx(() => Text('${controller.currentStep.value + 1}步/${controller.record.moves!.length}步',
              style: const TextStyle(fontFeatures: [FontFeature.tabularFigures()]))),
          Obx(
            () => TextButton(
              onPressed: controller.currentStep.value == length - 1
                  ? null
                  : () => controller.currentStep.value++,
              child: const Text('下一步'),
            ),
          ),
        ],
      ),
    );
  }
}
