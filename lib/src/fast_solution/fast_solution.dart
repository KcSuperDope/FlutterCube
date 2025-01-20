import 'package:cubestation_flutter/cube/cube.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fast_solution_controller.dart';


class FastSolutionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FastSolutionController>(() => FastSolutionController());
  }
}

class FastSolutionPage extends GetView<FastSolutionController> {

  const FastSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('快速复原'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Obx(() => SizedBox(
                height: 40,
                child:
                    Offstage(offstage: controller.isSolved.value, child: const Text('朝向：白顶绿前')))),
            const Expanded(child: Cube()),
            Obx(() => Text(controller.scrambleController.showSequence.join(' '),
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold))),
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
      ),
    );
  }
}
