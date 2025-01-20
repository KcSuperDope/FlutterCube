import 'package:cubestation_flutter/cube/cube.dart';
import 'package:cubestation_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'solution_controller.dart';

class SolutionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SolutionController>(() => SolutionController());
  }
}

class SolutionPage extends GetView<SolutionController> {
  const SolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('填色复原'),
          centerTitle: true,
        ),
        body:
            Obx(() => appOrientation.value == Orientation.landscape ? _landscape() : _portrait()));
  }

  Widget _portrait() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Obx(() => SizedBox(
              height: 40,
              child: Offstage(offstage: controller.isSolved.value, child: const Text('朝向：白顶绿前')))),
          SizedBox(
              height: Get.height * 0.4,
              width: Get.width,
              child: Obx(() => Cube(static: controller.show.value))),
          Obx(() => Text(
              controller.scrambleController.showSequence.isNotEmpty
                  ? controller.scrambleController.showSequence.first
                  : '',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold))),
          const SizedBox(height: 40),
          Obx(() => Offstage(
              offstage: controller.isSolved.value,
              child: IconButton(
                  onPressed: controller.nextStep,
                  icon: Icon(
                    Icons.fast_forward_rounded,
                    size: 60,
                  )))),
          Obx(() => Offstage(
              offstage: !controller.isSolved.value,
              child: Text(
                '复原完成',
                style: Get.textTheme.titleLarge,
              ))),
          const SizedBox(height: 40),
          Obx(() => Offstage(
              offstage: !controller.isSolved.value,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                child: const Text('完成'),
              ))),
          const Spacer()
        ],
      ),
    );
  }

  Widget _landscape() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          SizedBox(
              height: double.infinity,
              width: Get.width * 0.5,
              child: Obx(() => Cube(static: controller.show.value))),
          Column(
            children: [
              const SizedBox(height: 20),
              Obx(() => SizedBox(
                  height: 40,
                  child:
                      Offstage(offstage: controller.isSolved.value, child: const Text('朝向：白顶绿前')))),
              Obx(() => Text(
                  controller.scrambleController.showSequence.isNotEmpty
                      ? controller.scrambleController.showSequence.first
                      : '',
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold))),
              const SizedBox(height: 30),
              Obx(() => Offstage(
                  offstage: controller.isSolved.value,
                  child: IconButton(
                      onPressed: controller.nextStep,
                      icon: Icon(
                        Icons.fast_forward_rounded,
                        size: 60,
                      )))),
              Obx(() => Offstage(
                  offstage: !controller.isSolved.value,
                  child: Text(
                    '复原完成',
                    style: Get.textTheme.titleLarge,
                  ))),
              const SizedBox(height: 10),
              Obx(() => Offstage(
                  offstage: !controller.isSolved.value,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)))),
                    child: const Text('完成'),
                  ))),
              const Spacer()
            ],
          ),
        ],
      ),
    );
  }
}
