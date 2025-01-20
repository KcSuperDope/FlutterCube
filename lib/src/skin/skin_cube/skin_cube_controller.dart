import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/src/skin/skin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

class SkinCubeController extends GetxController with GetTickerProviderStateMixin {
  List<BoxModel> otherBoxList = [];

  ZVector rotate = const ZVector.only(x: -tau * 1 / 18, y: tau / 18);

  late AnimationController animationController;

  @override
  void onInit() {
    getCubeStatus();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    animationController.forward();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  //根据关卡生成对应魔方
  void getCubeStatus() {
    List<BoxModel> list = [];
    for (BoxModel m in Get.find<SkinController>().boxs) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      list.add(newModel);
    }
    otherBoxList = list;
  }
}
