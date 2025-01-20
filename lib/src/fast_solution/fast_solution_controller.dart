import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/cube/cube_controller.dart';
import 'package:cubestation_flutter/cube/scramble/scramble_controller.dart';
import 'package:cubestation_flutter/src/status_check/status_check.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FastSolutionController extends GetxController {
  var isSolved = false.obs;
  late StreamSubscription? _solvedSubscription;
  late ScrambleController scrambleController;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.dialog(const StatusCheckDialog(), arguments: _startSolution, barrierDismissible: false);
    });
    scrambleController = Get.find<ScrambleController>();
    super.onInit();
  }

  @override
  void onClose() {
    _solvedSubscription?.cancel();
    Get.find<CubeController>().isScrambling = false;
    super.onClose();
  }

  void _startSolution() async {
    _solvedSubscription = eventBus.on<SolvedEvent>().listen((event) {
      isSolved.value = true;
      _solvedSubscription!.cancel();
    });
    _solution();
  }

  void _solution() async {
    bool solved = await scrambleController.scramble(Cube.solved);
    if (solved) isSolved.value = true;
  }
}
