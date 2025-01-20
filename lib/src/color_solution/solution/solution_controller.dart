import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/cube/cube_controller.dart';
import 'package:cubestation_flutter/cube/scramble/scramble_controller.dart';
import 'package:cubestation_flutter/src/color_solution/orientation_check/orientation_check.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SolutionController extends GetxController {
  var isSolved = false.obs;
  late ScrambleController scrambleController;

  var show = false.obs;

  @override
  void onInit() {
    scrambleController = Get.find<ScrambleController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CubeController>().cube = Get.arguments;
      Get.find<CubeController>().updateCubeStatus();
      Get.dialog(const OrientationCheckDialog(), arguments: () {
        _solution();
      }, barrierDismissible: false);
    });
    once(scrambleController.showSequence, (sequence) {
      if (sequence.isNotEmpty) {
        show.value = true;
      }
    });
    super.onInit();
  }

  void nextStep() {
    if (Get.find<CubeController>().isScrambling == false) {
      return;
    }
    String step = scrambleController.showSequence.first;
    if (step.contains('2')) {
      _rotate2(step[0]);
    } else {
      _rotate(step);
    }
  }

  void _rotate2(String slice) {
    Get.find<CubeController>().isScrambling = false;
    Get.find<CubeController>().rotateSliceApi(slice);
    eventBus.fire(RotateSliceEvent(slice));
    Future.delayed(1.5.seconds, () {
      Get.find<CubeController>().rotateSliceApi(slice);
      eventBus.fire(RotateSliceEvent(slice));
      Future.delayed(1.seconds, () {
        Get.find<CubeController>().isScrambling = true;
        if (Get.find<CubeController>().cube.isSolved) {
          isSolved.value = true;
          Get.find<CubeController>().isScrambling = false;
        }
      });
    });
  }

  void _rotate(String slice) {
    Get.find<CubeController>().isScrambling = false;
    Get.find<CubeController>().rotateSliceApi(slice);
    eventBus.fire(RotateSliceEvent(slice));
    Future.delayed(1.seconds, () {
      Get.find<CubeController>().isScrambling = true;
      if (Get.find<CubeController>().cube.isSolved) {
        isSolved.value = true;
        Get.find<CubeController>().isScrambling = false;
      }
    });
  }

  void _solution() async {
    bool solved = await scrambleController.scramble(Cube.solved);
    if (solved) isSolved.value = true;
  }
}
