import 'dart:async';
import 'package:cuber/cuber.dart';
import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:cubestation_flutter/src/replay/replay_controller.dart';
import 'package:cubestation_flutter/utils/taskqueue_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

class ReplayCubeController extends GetxController with GetTickerProviderStateMixin {
  final RecordModel record;
  ReplayCubeController(this.record);
  List<BoxModel> rotateBoxList = [];
  List<BoxModel> otherBoxList = [];

  late AnimationController rotateXAnimationController;
  late AnimationController rotateYAnimationController;
  late AnimationController rotateZAnimationController;

  late Animation rotateXAnimation;
  late Animation rotateYAnimation;
  late Animation rotateZAnimation;

  ZVector rotate = const ZVector.only(x: -tau / 12, y: tau / 12);

  // ZVector rotate = const ZVector.only(x: tau * 5 / 12, y: -tau / 12);

  TaskQueueUtils queueUtils = TaskQueueUtils();

  final int _rotateSliceDuration = 70;

  //int steps = 0;

  late Cube cube;

  @override
  void onInit() {
    initCubeStatus();
    rotateXAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: rotateSliceDuration),
    )..addListener(() {
        update();
      });
    rotateYAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _rotateSliceDuration),
    )..addListener(() {
        update();
      });
    rotateZAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _rotateSliceDuration),
    )..addListener(() {
        update();
      });
    rotateXAnimation = Tween(begin: 0.0, end: tau / 4).animate(rotateXAnimationController);
    rotateYAnimation = Tween(begin: 0.0, end: tau / 4).animate(rotateYAnimationController);
    rotateZAnimation = Tween(begin: 0.0, end: tau / 4).animate(rotateZAnimationController);

    super.onInit();
  }

  @override
  void onClose() {
    rotateXAnimationController.dispose();
    rotateYAnimationController.dispose();
    rotateZAnimationController.dispose();
    super.onClose();
  }

  ///初始化魔方状态
  void initCubeStatus() {
    cube = Cube.from(record.definition!);
    otherBoxList.clear();
    rotateBoxList.clear();
    for (BoxModel m in initCube) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      otherBoxList.add(newModel);
    }
    _updateStatus();
    update();
  }

  // void startPlay() {
  //   //steps = record.moves!.length;
  //   for (var e in record.moves!) {
  //     rotateSliceApi(e.move!);
  //   }
  // }

  //转动协议
  void rotateSliceApi(String step) {
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
    // queueUtils.addTask(task).then((value) {
    //   steps--;
    //   if (steps == 0) {
    //     Future.delayed(2.seconds, () {
    //       Get.find<ReplayController>().playing.value = false;
    //       initCubeStatus();
    //     });
    //   }
    // });
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
      cube = cube.move(Move.parse(direction ? U : U_));
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
      cube = cube.move(Move.parse(direction ? D_ : D));
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
      cube = cube.move(Move.parse(direction ? R : R_));
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
      cube = cube.move(Move.parse(direction ? L_ : L));
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
      cube = cube.move(Move.parse(direction ? F : F_));
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
      cube = cube.move(Move.parse(direction ? B_ : B));
      _updateStatus();
      completer.complete();
    });
    return completer.future;
  }

  void _updateStatus() {
    List<BoxModel> allBoxList = rotateBoxList + otherBoxList;
    String definition = cube.definition;
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
}
