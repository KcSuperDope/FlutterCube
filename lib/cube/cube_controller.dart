import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/utils/taskqueue_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class CubeController extends GetxController with GetTickerProviderStateMixin {
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

  ZVector rotate = const ZVector.only(x: -tau / 12, y: tau / 12);

  vector.Matrix3 curMatrix3 = vector.Matrix3.identity();

  TaskQueueUtils queueUtils = TaskQueueUtils();

  bool isScrambling = false;

  //bool needFrameSync = true;
  Cube cube = Cube.solved;

  @override
  void onInit() {
    _initCubeStatus();
    rotateAllAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        update();
      });
    rotateXAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: rotateSliceDuration),
    )..addListener(() {
        update();
      });
    rotateYAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: rotateSliceDuration),
    )..addListener(() {
        update();
      });
    rotateZAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: rotateSliceDuration),
    )..addListener(() {
        update();
      });
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
    isScrambling = false;
    super.onClose();
  }

  //帧同步
  void frameSync() {
    //if (needFrameSync)
    if (queueUtils.frameSync()) {
      _updateStatus();
    }
  }

  ///初始化魔方状态
  void _initCubeStatus() {
    for (BoxModel m in initCube) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      otherBoxList.add(newModel);
    }
    _updateStatus(init: true);
    updatePitch(staticMatrix);
  }

  void initRotateAll() {
    rotate = const ZVector.only(x: tau * 4 / 9, y: tau * 4 / 9);
  }

  void rotateAll(bool direction, {double angle = tau / 4}) {
    Future rotateAllTask() {
      Completer completer = Completer();
      rotateAllAnimation =
          Tween(begin: 0.0, end: direction ? angle : -angle).animate(rotateAllAnimationController);
      rotateAllAnimationController.forward(from: 0).whenComplete(() {
        rotateAllAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateAllAnimationController);
        rotate = rotate.add(y: direction ? angle : -angle);
        completer.complete();
      });
      return completer.future;
    }

    queueUtils.addTask(rotateAllTask);
  }

  //更新魔方姿态角
  void updatePitch(vector.Matrix3 matrix3) {
    curMatrix3 = matrix3;
    update();
  }

  //转动协议
  void rotateSliceApi(String step) {
    cube = cube.move(Move.parse(step));
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
        default:
      }
    }

    queueUtils.addTask(task);
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
      _updateStatus();
      completer.complete();
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
      _updateStatus();
      completer.complete();
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
      _updateStatus();
      completer.complete();
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
      _updateStatus();
      completer.complete();
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
      _updateStatus();
      completer.complete();
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
      _updateStatus();
      completer.complete();
    });
    return completer.future;
  }

  void _updateStatus({bool init = false}) {
    List<BoxModel> allBoxList = rotateBoxList + otherBoxList;
    String definition;
    if (init) {
      definition = Cube.solved.definition;
    } else {
      definition = cube.definition;
    }
    //角块0号位
    allBoxList.firstWhere((m) => m.translate == corPositions[0])
      ..topColor = colorByLetter[definition[8]]
      ..frontColor = colorByLetter[definition[20]]
      ..rightColor = colorByLetter[definition[9]];
    //角块1号位
    allBoxList.firstWhere((m) => m.translate == corPositions[1])
      ..topColor = colorByLetter[definition[6]]
      ..frontColor = colorByLetter[definition[18]]
      ..leftColor = colorByLetter[definition[38]];
    //角块2号位
    allBoxList.firstWhere((m) => m.translate == corPositions[2])
      ..topColor = colorByLetter[definition[0]]
      ..leftColor = colorByLetter[definition[36]]
      ..rearColor = colorByLetter[definition[47]];
    //角块3号位
    allBoxList.firstWhere((m) => m.translate == corPositions[3])
      ..topColor = colorByLetter[definition[2]]
      ..rightColor = colorByLetter[definition[11]]
      ..rearColor = colorByLetter[definition[45]];
    //角块4号位
    allBoxList.firstWhere((m) => m.translate == corPositions[4])
      ..frontColor = colorByLetter[definition[26]]
      ..rightColor = colorByLetter[definition[15]]
      ..bottomColor = colorByLetter[definition[29]];
    //角块5号位
    allBoxList.firstWhere((m) => m.translate == corPositions[5])
      ..frontColor = colorByLetter[definition[24]]
      ..leftColor = colorByLetter[definition[44]]
      ..bottomColor = colorByLetter[definition[27]];
    //角块6号位
    allBoxList.firstWhere((m) => m.translate == corPositions[6])
      ..rearColor = colorByLetter[definition[53]]
      ..leftColor = colorByLetter[definition[42]]
      ..bottomColor = colorByLetter[definition[33]];
    //角块7号位
    allBoxList.firstWhere((m) => m.translate == corPositions[7])
      ..rearColor = colorByLetter[definition[51]]
      ..rightColor = colorByLetter[definition[17]]
      ..bottomColor = colorByLetter[definition[35]];

    //棱块0号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[0])
      ..topColor = colorByLetter[definition[5]]
      ..rightColor = colorByLetter[definition[10]];
    //棱块1号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[1])
      ..topColor = colorByLetter[definition[7]]
      ..frontColor = colorByLetter[definition[19]];
    //棱块2号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[2])
      ..topColor = colorByLetter[definition[3]]
      ..leftColor = colorByLetter[definition[37]];
    //棱块3号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[3])
      ..topColor = colorByLetter[definition[1]]
      ..rearColor = colorByLetter[definition[46]];
    //棱块4号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[4])
      ..rightColor = colorByLetter[definition[16]]
      ..bottomColor = colorByLetter[definition[32]];
    //棱块5号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[5])
      ..frontColor = colorByLetter[definition[25]]
      ..bottomColor = colorByLetter[definition[28]];
    //棱块6号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[6])
      ..leftColor = colorByLetter[definition[43]]
      ..bottomColor = colorByLetter[definition[30]];
    //棱块7号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[7])
      ..rearColor = colorByLetter[definition[52]]
      ..bottomColor = colorByLetter[definition[34]];
    //棱块8号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[8])
      ..frontColor = colorByLetter[definition[23]]
      ..rightColor = colorByLetter[definition[12]];
    //棱块9号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[9])
      ..frontColor = colorByLetter[definition[21]]
      ..leftColor = colorByLetter[definition[41]];
    //棱块10号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[10])
      ..rearColor = colorByLetter[definition[50]]
      ..leftColor = colorByLetter[definition[39]];
    //棱块11号位
    allBoxList.firstWhere((m) => m.translate == edgePositions[11])
      ..rearColor = colorByLetter[definition[48]]
      ..rightColor = colorByLetter[definition[14]];
  }

  //更新魔方状态
  void updateCubeStatus() {
    Future updateTask() {
      Completer completer = Completer();
      _updateStatus();
      update();
      completer.complete();
      return completer.future;
    }

    queueUtils.addTask(updateTask);
  }
}
