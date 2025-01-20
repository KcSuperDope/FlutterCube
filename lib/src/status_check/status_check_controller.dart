import 'dart:async';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusCheckController extends GetxController {
  var currentIndex = 0.obs;
  StreamSubscription? _rotateSubscription;
  VoidCallback? callback = Get.arguments;
  // StatusCheckController(this.callback);

  @override
  void onInit() {
    _rotateSubscription = eventBus.on<RotateSliceEvent>().listen((event) {
      if (currentIndex.value == 0) {
        currentIndex.value = 1;
      } else if (currentIndex.value == 1) {
        start();
      }
    });
    super.onInit();
  }

  void nextStep() {
    currentIndex.value = 1;
  }

  void lastStep() {
    currentIndex.value = 0;
  }

  void start() {
    if (callback != null) {
      callback!();
    }
    Get.back();
  }

  @override
  void onClose() {
    _rotateSubscription?.cancel();
    super.onClose();
  }
}
