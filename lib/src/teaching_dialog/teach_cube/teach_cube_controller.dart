import 'dart:async';
import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teaching_dialog_controller.dart';
import 'package:cubestation_flutter/utils/taskqueue_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class TeachCubeController extends GetxController with GetTickerProviderStateMixin {
  final VoidCallback updatePage;
  TeachCubeController(this.updatePage, this.initRotate);
  List<BoxModel> cubeStatus = [];
  String level = '';
  ZVector? initRotate;

  List<BoxModel> rotateBoxList = [];
  List<BoxModel> otherBoxList = [];

  late AnimationController rotateAllAnimationController;
  late AnimationController rotateXAnimationController;
  late AnimationController rotateYAnimationController;
  late AnimationController rotateZAnimationController;

  late Animation rotateAllAnimation;
  late Animation rotateXAnimation;
  late Animation rotateYAnimation;
  late Animation rotateZAnimation;

  // ZVector rotate = const ZVector.only(x: -tau / 12, y: tau / 12);
  ZVector rotate = const ZVector.only(x: tau * 4 / 9, y: -tau / 18);

  String curRotateAxis = Y;

  late TaskQueueUtils queueUtils;

  final int _rotateSliceDuration = 1000;

  int steps = 0;

  @override
  void onInit() {
    rotateAllAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _rotateSliceDuration),
    );
    rotateXAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _rotateSliceDuration),
    );
    rotateYAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _rotateSliceDuration),
    );
    rotateZAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _rotateSliceDuration),
    );
    rotateAllAnimation = Tween(begin: 0.0, end: tau / 4).animate(rotateAllAnimationController);
    rotateXAnimation = Tween(begin: 0.0, end: tau / 4).animate(rotateXAnimationController);
    rotateYAnimation = Tween(begin: 0.0, end: tau / 4).animate(rotateYAnimationController);
    rotateZAnimation = Tween(begin: 0.0, end: tau / 4).animate(rotateZAnimationController);
    super.onInit();
  }

  @override
  void onClose() {
    rotateAllAnimationController.dispose();
    rotateXAnimationController.dispose();
    rotateYAnimationController.dispose();
    rotateZAnimationController.dispose();
    super.onClose();
  }

  //根据关卡生成对应魔方
  void getCubeStatus() {
    List<BoxModel> list = [];
    for (BoxModel m in colorLessCube) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      list.add(newModel);
    }
    switch (level) {
      case '1_1_1':
        list.firstWhere((m) => m.id == BoxName.Y).bottomColor = DColor;
        list.firstWhere((m) => m.id == BoxName.BR)
          ..rearColor = UColor
          ..colorMap![-3] = UColor;
        break;
      case '1_1_2':
        list.firstWhere((m) => m.id == BoxName.Y).bottomColor = DColor;
        list.firstWhere((m) => m.id == BoxName.WR)
          ..topColor = UColor
          ..colorMap![2] = UColor;
        break;
      case '1_1_3':
        list.firstWhere((m) => m.id == BoxName.Y).bottomColor = DColor;
        list.firstWhere((m) => m.id == BoxName.YB)
          ..rearColor = UColor
          ..colorMap![-3] = UColor;
        break;
      case '1_2':
        list.firstWhere((m) => m.id == BoxName.Y).bottomColor = DColor;
        list.firstWhere((m) => m.id == BoxName.BR)
          ..rearColor = UColor
          ..colorMap![-3] = UColor;
        list.firstWhere((m) => m.id == BoxName.YB)
          ..rearColor = UColor
          ..colorMap![-3] = UColor;
        list.firstWhere((m) => m.id == BoxName.WO)
          ..leftColor = UColor
          ..colorMap![-1] = UColor;
        list.firstWhere((m) => m.id == BoxName.WG)
          ..topColor = UColor
          ..colorMap![2] = UColor;
        break;
      case '1_3':
        list.firstWhere((m) => m.id == BoxName.Y).bottomColor = DColor;
        list.firstWhere((m) => m.id == BoxName.W).topColor = UColor;
        list.firstWhere((m) => m.id == BoxName.O).leftColor = LColor;
        list.firstWhere((m) => m.id == BoxName.R).rightColor = RColor;
        list.firstWhere((m) => m.id == BoxName.G).frontColor = FColor;
        list.firstWhere((m) => m.id == BoxName.B).rearColor = BColor;
        list.firstWhere((m) => m.id == BoxName.YB)
          ..rearColor = FColor
          ..bottomColor = UColor
          ..colorMap![-2] = UColor
          ..colorMap![-3] = FColor;
        list.firstWhere((m) => m.id == BoxName.YR)
          ..rightColor = RColor
          ..bottomColor = UColor
          ..colorMap![1] = RColor
          ..colorMap![-2] = UColor;
        list.firstWhere((m) => m.id == BoxName.YG)
          ..frontColor = LColor
          ..bottomColor = UColor
          ..colorMap![3] = LColor
          ..colorMap![-2] = UColor;
        list.firstWhere((m) => m.id == BoxName.YO)
          ..leftColor = BColor
          ..bottomColor = UColor
          ..colorMap![-1] = BColor
          ..colorMap![-2] = UColor;
        break;
      case '2_1_1':
        list.firstWhere((m) => m.id == BoxName.R).rightColor = RColor;
        list.firstWhere((m) => m.id == BoxName.G).frontColor = FColor;
        list.firstWhere((m) => m.id == BoxName.WR).rightColor = RColor;
        list.firstWhere((m) => m.id == BoxName.WG)
          ..topColor = UColor
          ..frontColor = FColor
          ..colorMap![2] = UColor
          ..colorMap![3] = FColor;
        list.firstWhere((m) => m.id == BoxName.YGR)
          ..frontColor = FColor
          ..rightColor = UColor
          ..bottomColor = RColor
          ..colorMap![3] = FColor
          ..colorMap![1] = UColor
          ..colorMap![-2] = RColor;
        break;
      case '2_1_2':
        list.firstWhere((m) => m.id == BoxName.R).rightColor = RColor;
        list.firstWhere((m) => m.id == BoxName.G).frontColor = FColor;
        list.firstWhere((m) => m.id == BoxName.WG).frontColor = FColor;
        list.firstWhere((m) => m.id == BoxName.WR)
          ..rightColor = RColor
          ..topColor = UColor
          ..colorMap![1] = RColor
          ..colorMap![2] = UColor;
        list.firstWhere((m) => m.id == BoxName.YGR)
          ..frontColor = UColor
          ..rightColor = RColor
          ..bottomColor = FColor
          ..colorMap![3] = UColor
          ..colorMap![1] = RColor
          ..colorMap![-2] = FColor;
        break;
      case '2_1_3':
        list.firstWhere((m) => m.id == BoxName.R).rightColor = RColor;
        list.firstWhere((m) => m.id == BoxName.G).frontColor = FColor;
        list.firstWhere((m) => m.id == BoxName.WR).rightColor = RColor;
        list.firstWhere((m) => m.id == BoxName.WG)
          ..topColor = UColor
          ..frontColor = FColor
          ..colorMap![2] = UColor
          ..colorMap![3] = FColor;
        list.firstWhere((m) => m.id == BoxName.YGR)
          ..frontColor = RColor
          ..rightColor = FColor
          ..bottomColor = UColor
          ..colorMap![3] = RColor
          ..colorMap![1] = FColor
          ..colorMap![-2] = UColor;
        break;
      case '2_2':
        list.firstWhere((m) => m.id == BoxName.Y).bottomColor = DColor;
        list.firstWhere((m) => m.id == BoxName.O).leftColor = LColor;
        list.firstWhere((m) => m.id == BoxName.R).rightColor = RColor;
        list.firstWhere((m) => m.id == BoxName.G).frontColor = FColor;
        list.firstWhere((m) => m.id == BoxName.B).rearColor = BColor;
        list.firstWhere((m) => m.id == BoxName.WR)
          ..topColor = UColor
          ..rightColor = RColor
          ..colorMap![1] = RColor
          ..colorMap![2] = UColor;
        list.firstWhere((m) => m.id == BoxName.WG)
          ..topColor = UColor
          ..frontColor = FColor
          ..colorMap![2] = UColor
          ..colorMap![3] = FColor;
        list.firstWhere((m) => m.id == BoxName.WO)
          ..topColor = UColor
          ..leftColor = LColor
          ..colorMap![-1] = LColor
          ..colorMap![2] = UColor;
        list.firstWhere((m) => m.id == BoxName.WB).rearColor = BColor;
        list.firstWhere((m) => m.id == BoxName.YGR)
          ..frontColor = FColor
          ..rightColor = UColor
          ..bottomColor = RColor
          ..colorMap![3] = FColor
          ..colorMap![1] = UColor
          ..colorMap![-2] = RColor;
        list.firstWhere((m) => m.id == BoxName.YOG)
          ..frontColor = BColor
          ..leftColor = UColor
          ..bottomColor = RColor
          ..colorMap![3] = BColor
          ..colorMap![-1] = UColor
          ..colorMap![-2] = RColor;
        list.firstWhere((m) => m.id == BoxName.YOB)
          ..rearColor = LColor
          ..leftColor = UColor
          ..bottomColor = FColor
          ..colorMap![-3] = LColor
          ..colorMap![-1] = UColor
          ..colorMap![-2] = FColor;
        list.firstWhere((m) => m.id == BoxName.YRB)
          ..rearColor = LColor
          ..rightColor = UColor
          ..bottomColor = BColor
          ..colorMap![-3] = LColor
          ..colorMap![1] = UColor
          ..colorMap![-2] = BColor;
        break;
      //case '2_2':
      // list.firstWhere((m) => m.id == BoxName.W).topColor = UColor;
      // list.firstWhere((m) => m.id == BoxName.R).rightColor = RColor;
      // list.firstWhere((m) => m.id == BoxName.G).frontColor = FColor;
      // list.firstWhere((m) => m.id == BoxName.WR)
      //   ..topColor = UColor
      //   ..rightColor = RColor;
      // list.firstWhere((m) => m.id == BoxName.WG)
      //   ..topColor = UColor
      //   ..frontColor = FColor;
      // list.firstWhere((m) => m.id == BoxName.WO).topColor = UColor;
      // list.firstWhere((m) => m.id == BoxName.WB).topColor = UColor;
      // list.firstWhere((m) => m.id == BoxName.GR)
      //   ..rightColor = RColor
      //   ..frontColor = FColor;
      // list.firstWhere((m) => m.id == BoxName.GO).frontColor = FColor;
      // list.firstWhere((m) => m.id == BoxName.BR).rightColor = RColor;
      // list.firstWhere((m) => m.id == BoxName.YG)
      //   ..bottomColor = DColor
      //   ..frontColor = FColor;
      // list.firstWhere((m) => m.id == BoxName.YR)
      //   ..bottomColor = DColor
      //   ..rightColor = RColor;
      // list.firstWhere((m) => m.id == BoxName.YO).bottomColor = DColor;
      // list.firstWhere((m) => m.id == BoxName.YB).bottomColor = DColor;
      // list.firstWhere((m) => m.id == BoxName.YGR)
      //   ..bottomColor = DColor
      //   ..frontColor = FColor
      //   ..rightColor = RColor;
      // list.firstWhere((m) => m.id == BoxName.YOG)
      //   ..bottomColor = DColor
      //   ..frontColor = FColor;
      // list.firstWhere((m) => m.id == BoxName.YRB)
      //   ..bottomColor = DColor
      //   ..rightColor = RColor;
      // list.firstWhere((m) => m.id == BoxName.YOB).bottomColor = DColor;
      // list.firstWhere((m) => m.id == BoxName.WGR)
      //   ..topColor = UColor
      //   ..frontColor = FColor
      //   ..rightColor = RColor;
      // list.firstWhere((m) => m.id == BoxName.WRB)
      //   ..topColor = UColor
      //   ..rightColor = RColor;
      // list.firstWhere((m) => m.id == BoxName.WGO)
      //   ..topColor = UColor
      //   ..frontColor = FColor;
      // list.firstWhere((m) => m.id == BoxName.WOB).topColor = UColor;
      // break;
      default:
    }
    cubeStatus = list;
  }

  ///初始化魔方状态
  void recoverCubeStatus() {
    Get.find<TeachingDialogController>().startedPlaying.value = false;
    rotate = initRotate ?? const ZVector.only(x: tau * 4 / 9, y: -tau / 18);
    otherBoxList.clear();
    rotateBoxList.clear();
    for (BoxModel m in cubeStatus) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      otherBoxList.add(newModel);
    }
    updatePage();
  }

  void startPlay(List<String> formula) {
    queueUtils = TaskQueueUtils();
    steps = formula.length;
    for (var e in formula) {
      _rotateSliceApi(e);
    }
  }

  //转动协议
  void _rotateSliceApi(String step) {
    Future task() async {
      switch (step) {
        case U:
          await _rotateU(true);
          break;
        case U_:
          await _rotateU(false);
          break;
        case F:
          await _rotateF(true);
          break;
        case F_:
          await _rotateF(false);
          break;
        case R:
          await _rotateR(true);
          break;
        case R_:
          await _rotateR(false);
          break;
        case D_:
          await _rotateD(true);
          break;
        case D:
          await _rotateD(false);
          break;
        case L_:
          await _rotateL(true);
          break;
        case L:
          await _rotateL(false);
          break;
        case B_:
          await _rotateB(true);
          break;
        case B:
          await _rotateB(false);
          break;
        case X:
          await _rotateAll(true, X);
          break;
        case X_:
          await _rotateAll(false, X);
          break;
        case Y:
          await _rotateAll(true, Y);
          break;
        case Y_:
          await _rotateAll(false, Y);
          break;
        case Z:
          await _rotateAll(true, Z);
          break;
        case Z_:
          await _rotateAll(false, Z);
          break;
        default:
      }
    }

    queueUtils.addTask(task).then((value) {
      steps--;
      if (steps == 0) {
        Future.delayed(1.seconds, () {
          recoverCubeStatus();
        });
      }
    });
  }

  Future _rotateAll(bool direction, String axis) {
    curRotateAxis = axis;
    Completer completer = Completer();
    rotateAllAnimation = Tween(begin: 0.0, end: direction ? tau / 4 : -tau / 4)
        .animate(rotateAllAnimationController);
    rotateAllAnimationController.forward(from: 0).whenComplete(() {
      rotateAllAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateAllAnimationController);
      if (curRotateAxis == X) {
        rotate = rotate.add(x: direction ? tau / 4 : -tau / 4);
        rotate = rotate.add(y: direction ? tau / 18 : -tau / 18);
        if (rotate.z < 0) {
          rotate = rotate.add(z: direction ? tau / 18 : -tau / 18);
        } else {
          rotate = rotate.subtract(z: direction ? tau / 18 : -tau / 18);
        }
      }
      if (curRotateAxis == Y) {
        rotate = rotate.add(y: direction ? tau / 4 : -tau / 4);
      }
      if (curRotateAxis == Z) {
        rotate = rotate.add(z: direction ? tau / 4 : -tau / 4);
      }
      Future.delayed(0.5.seconds, () {
        completer.complete();
      });
    });
    return completer.future;
  }

  Future _rotateU(bool direction) {
    Completer completer = Completer();
    List<BoxModel> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList.where((m) => m.translate?.y == -boxOffset).toList();
    allBoxList.removeWhere((m) => m.translate?.y == -boxOffset);
    otherBoxList = allBoxList;
    rotateYAnimation =
        Tween(begin: 0.0, end: direction ? tau / 4 : -tau / 4).animate(rotateYAnimationController);
    rotateYAnimationController.forward(from: 0).whenComplete(() {
      rotateYAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateYAnimationController);
      _updateWhiteOrYellowSliceStatus(direction);
      Future.delayed(0.5.seconds, () {
        completer.complete();
      });
    });
    return completer.future;
  }

  Future _rotateD(bool direction) {
    Completer completer = Completer();
    List<BoxModel> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList.where((m) => m.translate?.y == boxOffset).toList();
    allBoxList.removeWhere((m) => m.translate?.y == boxOffset);
    otherBoxList = allBoxList;
    rotateYAnimation =
        Tween(begin: 0.0, end: direction ? tau / 4 : -tau / 4).animate(rotateYAnimationController);
    rotateYAnimationController.forward(from: 0).whenComplete(() {
      rotateYAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateYAnimationController);
      _updateWhiteOrYellowSliceStatus(direction);
      Future.delayed(0.5.seconds, () {
        completer.complete();
      });
    });
    return completer.future;
  }

  Future _rotateR(bool direction) {
    Completer completer = Completer();
    List<BoxModel> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList.where((m) => m.translate?.x == boxOffset).toList();
    allBoxList.removeWhere((m) => m.translate?.x == boxOffset);
    otherBoxList = allBoxList;
    rotateXAnimation =
        Tween(begin: 0.0, end: direction ? tau / 4 : -tau / 4).animate(rotateXAnimationController);
    rotateXAnimationController.forward(from: 0).whenComplete(() {
      rotateXAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateXAnimationController);
      _updateRedOrOrangeSliceStatus(direction);
      Future.delayed(0.5.seconds, () {
        completer.complete();
      });
    });
    return completer.future;
  }

  Future _rotateL(bool direction) {
    Completer completer = Completer();
    List<BoxModel> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList.where((m) => m.translate?.x == -boxOffset).toList();
    allBoxList.removeWhere((m) => m.translate?.x == -boxOffset);
    otherBoxList = allBoxList;
    rotateXAnimation =
        Tween(begin: 0.0, end: direction ? tau / 4 : -tau / 4).animate(rotateXAnimationController);
    rotateXAnimationController.forward(from: 0).whenComplete(() {
      rotateXAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateXAnimationController);
      _updateRedOrOrangeSliceStatus(direction);
      Future.delayed(0.5.seconds, () {
        completer.complete();
      });
    });
    return completer.future;
  }

  Future _rotateF(bool direction) {
    Completer completer = Completer();
    List<BoxModel> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList.where((m) => m.translate?.z == boxOffset).toList();
    allBoxList.removeWhere((m) => m.translate?.z == boxOffset);
    otherBoxList = allBoxList;
    rotateZAnimation =
        Tween(begin: 0.0, end: direction ? tau / 4 : -tau / 4).animate(rotateZAnimationController);
    rotateZAnimationController.forward(from: 0).whenComplete(() {
      rotateZAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateZAnimationController);
      _updateGreenOrBlueSliceStatus(direction);
      Future.delayed(0.5.seconds, () {
        completer.complete();
      });
    });
    return completer.future;
  }

  Future _rotateB(bool direction) {
    Completer completer = Completer();
    List<BoxModel> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList.where((m) => m.translate?.z == -boxOffset).toList();
    allBoxList.removeWhere((m) => m.translate?.z == -boxOffset);
    otherBoxList = allBoxList;
    rotateZAnimation =
        Tween(begin: 0.0, end: direction ? tau / 4 : -tau / 4).animate(rotateZAnimationController);
    rotateZAnimationController.forward(from: 0).whenComplete(() {
      rotateZAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateZAnimationController);
      _updateGreenOrBlueSliceStatus(direction);
      Future.delayed(0.5.seconds, () {
        completer.complete();
      });
    });
    return completer.future;
  }

  void _updateRedOrOrangeSliceStatus(bool direction) {
    //角块0号位
    BoxModel corM0 = rotateBoxList
        .firstWhere((m) => m.translate?.z == boxOffset && m.translate?.y == -boxOffset);

    //角块1号位
    BoxModel corM1 = rotateBoxList
        .firstWhere((m) => m.translate?.z == -boxOffset && m.translate?.y == -boxOffset);

    //角块2号位
    BoxModel corM2 = rotateBoxList
        .firstWhere((m) => m.translate?.z == -boxOffset && m.translate?.y == boxOffset);

    //角块3号位
    BoxModel corM3 =
        rotateBoxList.firstWhere((m) => m.translate?.z == boxOffset && m.translate?.y == boxOffset);

    //楞块0号位
    BoxModel edgeM0 =
        rotateBoxList.firstWhere((m) => m.translate?.z == 0 && m.translate?.y == -boxOffset);

    //楞块1号位
    BoxModel edgeM1 =
        rotateBoxList.firstWhere((m) => m.translate?.z == -boxOffset && m.translate?.y == 0);

    //楞块2号位
    BoxModel edgeM2 =
        rotateBoxList.firstWhere((m) => m.translate?.z == 0 && m.translate?.y == boxOffset);

    //楞块3号位
    BoxModel edgeM3 =
        rotateBoxList.firstWhere((m) => m.translate?.z == boxOffset && m.translate?.y == 0);

    _updateSlice(
        VectorAxis.x, corM0, corM1, corM2, corM3, edgeM0, edgeM1, edgeM2, edgeM3, direction);
  }

  void _updateGreenOrBlueSliceStatus(bool direction) {
    //角块0号位
    BoxModel corM0 = rotateBoxList
        .firstWhere((m) => m.translate?.x == -boxOffset && m.translate?.y == -boxOffset);

    //角块1号位
    BoxModel corM1 = rotateBoxList
        .firstWhere((m) => m.translate?.x == boxOffset && m.translate?.y == -boxOffset);

    //角块2号位
    BoxModel corM2 =
        rotateBoxList.firstWhere((m) => m.translate?.x == boxOffset && m.translate?.y == boxOffset);

    //角块3号位
    BoxModel corM3 = rotateBoxList
        .firstWhere((m) => m.translate?.x == -boxOffset && m.translate?.y == boxOffset);

    //楞块0号位
    BoxModel edgeM0 =
        rotateBoxList.firstWhere((m) => m.translate?.x == 0 && m.translate?.y == -boxOffset);

    //楞块1号位
    BoxModel edgeM1 =
        rotateBoxList.firstWhere((m) => m.translate?.x == boxOffset && m.translate?.y == 0);

    //楞块2号位
    BoxModel edgeM2 =
        rotateBoxList.firstWhere((m) => m.translate?.x == 0 && m.translate?.y == boxOffset);

    //楞块3号位
    BoxModel edgeM3 =
        rotateBoxList.firstWhere((m) => m.translate?.x == -boxOffset && m.translate?.y == 0);

    _updateSlice(
        VectorAxis.z, corM0, corM1, corM2, corM3, edgeM0, edgeM1, edgeM2, edgeM3, direction);
  }

  void _updateWhiteOrYellowSliceStatus(bool direction) {
    //角块0号位
    BoxModel corM0 = rotateBoxList
        .firstWhere((m) => m.translate?.x == -boxOffset && m.translate?.z == -boxOffset);

    //角块1号位
    BoxModel corM1 = rotateBoxList
        .firstWhere((m) => m.translate?.x == boxOffset && m.translate?.z == -boxOffset);

    //角块2号位
    BoxModel corM2 =
        rotateBoxList.firstWhere((m) => m.translate?.x == boxOffset && m.translate?.z == boxOffset);

    //角块3号位
    BoxModel corM3 = rotateBoxList
        .firstWhere((m) => m.translate?.x == -boxOffset && m.translate?.z == boxOffset);

    //楞块0号位
    BoxModel edgeM0 =
        rotateBoxList.firstWhere((m) => m.translate?.x == 0 && m.translate?.z == -boxOffset);

    //楞块1号位
    BoxModel edgeM1 =
        rotateBoxList.firstWhere((m) => m.translate?.x == boxOffset && m.translate?.z == 0);

    //楞块2号位
    BoxModel edgeM2 =
        rotateBoxList.firstWhere((m) => m.translate?.x == 0 && m.translate?.z == boxOffset);

    //楞块3号位
    BoxModel edgeM3 =
        rotateBoxList.firstWhere((m) => m.translate?.x == -boxOffset && m.translate?.z == 0);

    _updateSlice(
        VectorAxis.y, corM0, corM1, corM2, corM3, edgeM0, edgeM1, edgeM2, edgeM3, direction);
  }

  void _updateSlice(VectorAxis axis, BoxModel cor0, BoxModel cor1, BoxModel cor2, BoxModel cor3,
      BoxModel edge0, BoxModel edge1, BoxModel edge2, BoxModel edge3, bool direction) {
    if (direction) {
      _swapBoxTranslate(cor0, cor1, cor2, cor3);
      _swapBoxTranslate(edge0, edge1, edge2, edge3);
    } else {
      _swapBoxTranslate(cor3, cor2, cor1, cor0);
      _swapBoxTranslate(edge3, edge2, edge1, edge0);
    }
    for (var m in rotateBoxList) {
      if (m.id!.length != 1) {
        _rotate(m, axis, direction);
      }
    }
  }

  void _swapBoxTranslate(BoxModel a, BoxModel b, BoxModel c, BoxModel d) {
    ZVector tempA = ZVector(a.translate!.x, a.translate!.y, a.translate!.z);
    ZVector tempB = ZVector(b.translate!.x, b.translate!.y, b.translate!.z);
    ZVector tempC = ZVector(c.translate!.x, c.translate!.y, c.translate!.z);
    ZVector tempD = ZVector(d.translate!.x, d.translate!.y, d.translate!.z);
    a.translate = tempB;
    b.translate = tempC;
    c.translate = tempD;
    d.translate = tempA;
  }

  void _rotate(BoxModel m, VectorAxis Axis, bool direction) {
    List<double>? newDirection;
    switch (Axis) {
      case VectorAxis.x:
        newDirection = _applyMatrix(m.direction!, direction ? xMatrix : nxMatrix);
        break;
      case VectorAxis.y:
        newDirection = _applyMatrix(m.direction!, direction ? yMatrix : nyMatrix);
        break;
      case VectorAxis.z:
        newDirection = _applyMatrix(m.direction!, direction ? zMatrix : nzMatrix);
        break;
      default:
    }
    _changeColor(m, newDirection!);
  }

  void _changeColor(BoxModel m, List<double> newDirection) {
    m.direction = newDirection;

    m.rightColor = m.colorMap![newDirection[0]]!;
    m.leftColor = m.colorMap![-newDirection[0]]!;
    m.topColor = m.colorMap![newDirection[1]]!;
    m.bottomColor = m.colorMap![-newDirection[1]]!;
    m.frontColor = m.colorMap![newDirection[2]]!;
    m.rearColor = m.colorMap![-newDirection[2]]!;
    // Get.find<BoxController>().update([m.id!]);
  }

  List<double> _applyMatrix(List<double> vector, vector.Matrix3 matrix3) {
    ZVector zVector =
        matrix3.transform(ZVector(vector[0], vector[1], vector[2]).asVector3()).asVector();
    return [zVector.x, zVector.y, zVector.z];
  }
}
