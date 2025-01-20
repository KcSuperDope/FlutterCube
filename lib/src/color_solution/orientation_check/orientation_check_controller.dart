
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrientationCheckController extends GetxController {
  VoidCallback? callback = Get.arguments;

  void start() {
    if (callback != null) {
      callback!();
    }
    Get.back();
  }
}
