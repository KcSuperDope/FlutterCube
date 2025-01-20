import 'dart:async';
import 'package:cubestation_flutter/handler/ble_data_handler.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:cubestation_flutter/utils/eventbus_utils.dart';
import 'package:cubestation_flutter/utils/taskqueue_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'box/box.dart';
import 'box/box_controller.dart';
import 'box/box_model.dart';
import 'cube_constant.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Cube1Controller extends GetxController with GetTickerProviderStateMixin {
  List<Box> rotateBoxList = [];
  List<Box> otherBoxList = [];

  late AnimationController rotateAllAnimationController;
  late AnimationController rotateXAnimationController;
  late AnimationController rotateYAnimationController;
  late AnimationController rotateZAnimationController;

  vector.Matrix3 curMatrix3 = vector.Matrix3.identity();
  //当前魔方旋转面
  String? curRotateSlice;
  //当前魔方旋转面角度 顺时针90度，逆时针-90度
  double curRotateSliceAngle = tau / 4;

  int? rotateDirection;

  bool isScrambling = false;

  bool fastSolution = false;

  bool needFrameSync = true;

  late Animation rotateAllAnimation;
  late Animation rotateXAnimation;
  late Animation rotateYAnimation;
  late Animation rotateZAnimation;

  TaskQueueUtils queueUtils = TaskQueueUtils();

  ZVector rotate = const ZVector.only(x: -tau / 18, y: tau / 18);

  @override
  void onInit() {
    initCubeStatus();
    rotateAllAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        update(['all']);
      });
    rotateXAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: rotateSliceDuration),
    )..addListener(() {
        update(['slice']);
      });
    rotateYAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: rotateSliceDuration),
    )..addListener(() {
        update(['slice']);
      });
    rotateZAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: rotateSliceDuration),
    )..addListener(() {
        update(['slice']);
      });

    rotateAllAnimation = Tween(begin: 0.0, end: tau / 4).animate(rotateAllAnimationController);
    rotateXAnimation =
        Tween(begin: 0.0, end: curRotateSliceAngle).animate(rotateXAnimationController);
    rotateYAnimation =
        Tween(begin: 0.0, end: curRotateSliceAngle).animate(rotateYAnimationController);
    rotateZAnimation =
        Tween(begin: 0.0, end: curRotateSliceAngle).animate(rotateZAnimationController);
    Get.find<HomeController>().cubeDisplay = true;
    super.onInit();
  }

  @override
  void onClose() {
    rotateAllAnimationController.dispose();
    rotateXAnimationController.dispose();
    rotateYAnimationController.dispose();
    rotateZAnimationController.dispose();
    Get.find<HomeController>().cubeDisplay = false;
    isScrambling = false;
    super.onClose();
  }

  ///初始化魔方状态
  void initCubeStatus() {
    otherBoxList.clear();
    rotateBoxList.clear();
    for (BoxModel m in solvedList) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      otherBoxList.add(Box(boxModel: newModel));
    }
    updatePitch(staticMatrix);
    update(['slice']);
    BleDataHandler().updateCubeStatus();
  }

  //更新魔方姿态角
  void updatePitch(vector.Matrix3 matrix3) {
    curMatrix3 = matrix3;
    update(['all']);
  }

  //帧同步
  void frameSync() {
    if (needFrameSync) queueUtils.frameSync();
  }

  //旋转id面
  void rotateSlice(String id, int direction) {
    Future task() {
      return Future(() async {
        rotateDirection = direction;
        curRotateSlice = id;
        curRotateSliceAngle = rotateDirection == CubeDirection.antiClockwise ? -tau / 4 : tau / 4;
        switch (id) {
          case BoxName.R:
            await _rotateRedOrOrangeSlice();
            break;
          case BoxName.O:
            await _rotateRedOrOrangeSlice();
            break;
          case BoxName.G:
            await _rotateGreenOrBlueSlice();
            break;
          case BoxName.B:
            await _rotateGreenOrBlueSlice();
            break;
          case BoxName.W:
            await _rotateWhiteOrYellowSlice();
            break;
          case BoxName.Y:
            await _rotateWhiteOrYellowSlice();
            break;
          default:
            break;
        }
      });
    }

    queueUtils.addTask(task);
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

  Future _rotateRedOrOrangeSlice() {
    Completer completer = Completer();
    bool isRed = curRotateSlice == BoxName.R;
    List<Box> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList
        .where((m) => m.boxModel.translate?.x == (isRed ? boxOffset : -boxOffset))
        .toList();
    allBoxList.removeWhere((m) => m.boxModel.translate?.x == (isRed ? boxOffset : -boxOffset));
    otherBoxList = allBoxList;
    rotateXAnimation =
        Tween(begin: 0.0, end: curRotateSliceAngle).animate(rotateXAnimationController);
    rotateXAnimationController.forward(from: 0).whenComplete(() {
      rotateXAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateXAnimationController);
      _updateRedOrOrangeSliceStatus();
      completer.complete();
    });
    return completer.future;
  }

  Future _rotateGreenOrBlueSlice() {
    Completer completer = Completer();
    bool isGreen = curRotateSlice == BoxName.G;
    List<Box> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList
        .where((m) => m.boxModel.translate?.z == (isGreen ? boxOffset : -boxOffset))
        .toList();
    allBoxList.removeWhere((m) => m.boxModel.translate?.z == (isGreen ? boxOffset : -boxOffset));
    otherBoxList = allBoxList;
    rotateZAnimation =
        Tween(begin: 0.0, end: curRotateSliceAngle).animate(rotateZAnimationController);
    rotateZAnimationController.forward(from: 0).whenComplete(() {
      rotateZAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateZAnimationController);
      _updateGreenOrBlueSliceStatus();
      completer.complete();
    });
    return completer.future;
  }

  //rotateDirection：0-顺时针，1-逆时针
  Future _rotateWhiteOrYellowSlice() {
    Completer completer = Completer();
    bool isWhite = curRotateSlice == BoxName.W;
    List<Box> allBoxList = rotateBoxList + otherBoxList;
    rotateBoxList.clear();
    rotateBoxList = allBoxList
        .where((m) => m.boxModel.translate?.y == (isWhite ? -boxOffset : boxOffset))
        .toList();
    allBoxList.removeWhere((m) => m.boxModel.translate?.y == (isWhite ? -boxOffset : boxOffset));
    otherBoxList = allBoxList;
    rotateYAnimation =
        Tween(begin: 0.0, end: curRotateSliceAngle).animate(rotateYAnimationController);
    rotateYAnimationController.forward(from: 0).whenComplete(() {
      rotateYAnimation = Tween(begin: 0.0, end: 0.0).animate(rotateYAnimationController);
      _updateWhiteOrYellowSliceStatus();
      completer.complete();
    });
    return completer.future;
  }

  void _updateRedOrOrangeSliceStatus() {
    //角块0号位
    Box corM0 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.z == boxOffset && m.boxModel.translate?.y == -boxOffset);

    //角块1号位
    Box corM1 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.z == -boxOffset && m.boxModel.translate?.y == -boxOffset);

    //角块2号位
    Box corM2 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.z == -boxOffset && m.boxModel.translate?.y == boxOffset);

    //角块3号位
    Box corM3 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.z == boxOffset && m.boxModel.translate?.y == boxOffset);

    //楞块0号位
    Box edgeM0 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.z == 0 && m.boxModel.translate?.y == -boxOffset);

    //楞块1号位
    Box edgeM1 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.z == -boxOffset && m.boxModel.translate?.y == 0);

    //楞块2号位
    Box edgeM2 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.z == 0 && m.boxModel.translate?.y == boxOffset);

    //楞块3号位
    Box edgeM3 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.z == boxOffset && m.boxModel.translate?.y == 0);

    _updateSlice(VectorAxis.x, corM0, corM1, corM2, corM3, edgeM0, edgeM1, edgeM2, edgeM3);
  }

  void _updateGreenOrBlueSliceStatus() {
    //角块0号位
    Box corM0 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.x == -boxOffset && m.boxModel.translate?.y == -boxOffset);

    //角块1号位
    Box corM1 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.x == boxOffset && m.boxModel.translate?.y == -boxOffset);

    //角块2号位
    Box corM2 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.x == boxOffset && m.boxModel.translate?.y == boxOffset);

    //角块3号位
    Box corM3 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.x == -boxOffset && m.boxModel.translate?.y == boxOffset);

    //楞块0号位
    Box edgeM0 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.x == 0 && m.boxModel.translate?.y == -boxOffset);

    //楞块1号位
    Box edgeM1 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.x == boxOffset && m.boxModel.translate?.y == 0);

    //楞块2号位
    Box edgeM2 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.x == 0 && m.boxModel.translate?.y == boxOffset);

    //楞块3号位
    Box edgeM3 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.x == -boxOffset && m.boxModel.translate?.y == 0);

    _updateSlice(VectorAxis.z, corM0, corM1, corM2, corM3, edgeM0, edgeM1, edgeM2, edgeM3);
  }

  void _updateWhiteOrYellowSliceStatus() {
    //角块0号位
    Box corM0 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.x == -boxOffset && m.boxModel.translate?.z == -boxOffset);

    //角块1号位
    Box corM1 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.x == boxOffset && m.boxModel.translate?.z == -boxOffset);

    //角块2号位
    Box corM2 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.x == boxOffset && m.boxModel.translate?.z == boxOffset);

    //角块3号位
    Box corM3 = rotateBoxList.firstWhere(
        (m) => m.boxModel.translate?.x == -boxOffset && m.boxModel.translate?.z == boxOffset);

    //楞块0号位
    Box edgeM0 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.x == 0 && m.boxModel.translate?.z == -boxOffset);

    //楞块1号位
    Box edgeM1 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.x == boxOffset && m.boxModel.translate?.z == 0);

    //楞块2号位
    Box edgeM2 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.x == 0 && m.boxModel.translate?.z == boxOffset);

    //楞块3号位
    Box edgeM3 = rotateBoxList
        .firstWhere((m) => m.boxModel.translate?.x == -boxOffset && m.boxModel.translate?.z == 0);

    _updateSlice(VectorAxis.y, corM0, corM1, corM2, corM3, edgeM0, edgeM1, edgeM2, edgeM3);
  }

  void _updateSlice(VectorAxis axis, Box cor0, Box cor1, Box cor2, Box cor3, Box edge0, Box edge1,
      Box edge2, Box edge3) {
    if (rotateDirection == CubeDirection.antiClockwise) {
      _swapBoxTranslate(cor3.boxModel, cor2.boxModel, cor1.boxModel, cor0.boxModel);
      _swapBoxTranslate(edge3.boxModel, edge2.boxModel, edge1.boxModel, edge0.boxModel);
    } else {
      _swapBoxTranslate(cor0.boxModel, cor1.boxModel, cor2.boxModel, cor3.boxModel);
      _swapBoxTranslate(edge0.boxModel, edge1.boxModel, edge2.boxModel, edge3.boxModel);
    }
    for (var m in rotateBoxList) {
      if (m.boxModel.id!.length != 1) {
        _rotate(m.boxModel, axis);
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

  void _rotate(BoxModel m, VectorAxis Axis) {
    List<double>? newDirection;
    switch (Axis) {
      case VectorAxis.x:
        newDirection = _applyMatrix(
            m.direction!, rotateDirection == CubeDirection.antiClockwise ? nxMatrix : xMatrix);
        break;
      case VectorAxis.y:
        newDirection = _applyMatrix(
            m.direction!, rotateDirection == CubeDirection.antiClockwise ? nyMatrix : yMatrix);
        break;
      case VectorAxis.z:
        newDirection = _applyMatrix(
            m.direction!, rotateDirection == CubeDirection.antiClockwise ? nzMatrix : zMatrix);
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
    Get.find<BoxController>().update([m.id!]);
  }

  List<double> _applyMatrix(List<double> vector, vector.Matrix3 matrix3) {
    ZVector zVector =
        matrix3.transform(ZVector(vector[0], vector[1], vector[2]).asVector3()).asVector();
    return [zVector.x, zVector.y, zVector.z];
  }

  //更新魔方状态
  void updateCubeStatus(List<String> corPList, List<String> corDList, List<String> edgePList,
      List<String> edgeDList) {
    Future updateTask() {
      Completer completer = Completer();
      List<Box> allBoxList = rotateBoxList + otherBoxList;
      for (int i = 0; i < 8; i++) {
        Box cor = allBoxList.firstWhere((m) => m.boxModel.id == corPList[i]);
        cor.boxModel.translate = corPositions[i];
        List<double> newDirection =
            getCorBoxDirection(cor.boxModel, i, int.parse(corDList[i], radix: 2));
        _changeColor(cor.boxModel, newDirection);
        if (fastSolution) {
          // eventBus.fire(GetCornerColorEvent(i, cor.boxModel));
        }
      }

      for (int i = 0; i < 12; i++) {
        Box edge = allBoxList.firstWhere((m) => m.boxModel.id == edgePList[i]);
        edge.boxModel.translate = edgePositions[i];
        List<double> newDirection =
            getedgeBoxDirection(edge.boxModel, i, int.parse(edgeDList[i], radix: 2));
        _changeColor(edge.boxModel, newDirection);
        if (fastSolution) {
          // eventBus.fire(GetEdgeColorEvent(i, edge.boxModel));
        }
      }
      completer.complete();
      if (fastSolution) {
        // eventBus.fire(UpdateCubeStatusCompletedEvent());
        fastSolution = false;
      }

      return completer.future;
    }

    queueUtils.addTask(updateTask);
  }

  List<double> getCorBoxDirection(BoxModel m, int position, int direction) {
    List<double> dir = [];
    dir.addAll(m.directionMap![direction]);
    switch (m.id) {
      case BoxName.WGR:
        transformC(position, dir);
        break;
      case BoxName.WGO:
        if (position == 0) {
          position += 3;
        } else if (0 < position && position < 4) {
          position -= 1;
        } else if (4 <= position && position < 7) {
          position += 1;
        } else if (position == 7) {
          position -= 3;
        }
        transformC(position, dir);
        break;
      case BoxName.WOB:
        if (0 <= position && position < 2) {
          position += 2;
        } else if (2 <= position && position < 4) {
          position -= 2;
        } else if (4 <= position && position < 6) {
          position += 2;
        } else if (6 <= position && position <= 7) {
          position -= 2;
        }
        transformC(position, dir);
        break;
      case BoxName.WRB:
        if (0 <= position && position < 3) {
          position += 1;
        } else if (position == 3) {
          position -= 3;
        } else if (position == 4) {
          position += 3;
        } else if (5 <= position && position <= 7) {
          position -= 1;
        }
        transformC(position, dir);
        break;
      case BoxName.YGR:
        if (0 <= position && position < 4) {
          position += 4;
        } else if (4 <= position && position <= 7) {
          position -= 4;
        }
        transformC(position, dir);
        break;
      case BoxName.YOG:
        if (0 <= position && position < 3) {
          position += 5;
        } else if (position == 3) {
          position += 1;
        } else if (position == 4) {
          position -= 1;
        } else if (4 < position && position <= 7) {
          position -= 5;
        }
        transformC(position, dir);
        break;
      case BoxName.YOB:
        if (0 <= position && position < 2) {
          position += 6;
        } else if (2 <= position && position < 4) {
          position += 2;
        } else if (4 <= position && position < 6) {
          position -= 2;
        } else if (6 <= position && position <= 7) {
          position -= 6;
        }
        transformC(position, dir);
        break;
      case BoxName.YRB:
        if (position == 0) {
          position += 7;
        } else if (1 <= position && position < 4) {
          position += 3;
        } else if (4 <= position && position < 7) {
          position -= 3;
        } else if (position == 7) {
          position -= 7;
        }
        transformC(position, dir);
        break;
      default:
    }

    return dir;
  }

  List<double> getedgeBoxDirection(BoxModel m, int position, int direction) {
    List<double> dir = [];
    dir.addAll(m.directionMap![direction]);
    switch (m.id) {
      case BoxName.WR:
        dir = transformWR(position, dir);
        break;
      case BoxName.WG:
        dir = transformWG(position, dir);
        break;
      case BoxName.WO:
        dir = transformWO(position, dir);
        break;
      case BoxName.WB:
        dir = transformWB(position, dir);
        break;
      case BoxName.YR:
        dir = transformYR(position, dir);
        break;
      case BoxName.YG:
        dir = transformYG(position, dir);
        break;
      case BoxName.YO:
        dir = transformYO(position, dir);
        break;
      case BoxName.YB:
        dir = transformYB(position, dir);
        break;
      case BoxName.GR:
        dir = transformGR(position, dir);
        break;
      case BoxName.GO:
        dir = transformGO(position, dir);
        break;
      case BoxName.BO:
        dir = transformBO(position, dir);
        break;
      case BoxName.BR:
        dir = transformBR(position, dir);
        break;
      default:
    }

    return dir;
  }

  void transformC(int position, List<double> dir) {
    switch (position) {
      case 0:
        break;
      case 1:
        transform0(dir);
        break;
      case 2:
        transform1(dir);
        break;
      case 3:
        transform2(dir);
        break;
      case 4:
        transform3(dir);
        break;
      case 5:
        transform4(dir);
        break;
      case 6:
        transform5(dir);
        break;
      case 7:
        transform6(dir);
        break;
      default:
    }
  }

  List<double> transformWR(int position, List<double> dir) {
    switch (position) {
      case 0:
        break;
      case 1:
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, xMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformWG(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 1:
        break;
      case 2:
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformWO(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 2:
        break;
      case 3:
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformWB(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 3:
        break;
      case 4:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformYR(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 4:
        break;
      case 5:
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, nxMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformYG(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 5:
        break;
      case 6:
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformYO(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 6:
        break;
      case 7:
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformYB(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 7:
        break;
      case 8:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, nyMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, nxMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformGR(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 8:
        break;
      case 9:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformGO(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 9:
        break;
      case 10:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 11:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformBO(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 10:
        break;
      case 11:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      default:
    }
    return dir;
  }

  List<double> transformBR(int position, List<double> dir) {
    switch (position) {
      case 0:
        dir = _applyMatrix(dir, nxMatrix);
        break;
      case 1:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 2:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 3:
        dir = _applyMatrix(dir, nxMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 4:
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 5:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 6:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 7:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, nyMatrix);
        break;
      case 8:
        dir = _applyMatrix(dir, xMatrix);
        dir = _applyMatrix(dir, xMatrix);
        break;
      case 9:
        dir = _applyMatrix(dir, yMatrix);
        dir = _applyMatrix(dir, yMatrix);
        break;
      case 10:
        dir = _applyMatrix(dir, zMatrix);
        dir = _applyMatrix(dir, zMatrix);
        break;
      case 11:
        break;
      default:
    }
    return dir;
  }

  void transform0(List<double> list) {
    list[2] = -list[2];
    swap(list, 0, 2);
  }

  void transform1(List<double> list) {
    list[0] = -list[0];
    list[2] = -list[2];
  }

  void transform2(List<double> list) {
    list[0] = -list[0];
    swap(list, 0, 2);
  }

  void transform3(List<double> list) {
    list[1] = -list[1];
    swap(list, 0, 2);
  }

  void transform4(List<double> list) {
    list[0] = -list[0];
    list[1] = -list[1];
  }

  void transform5(List<double> list) {
    list[0] = -list[0];
    list[1] = -list[1];
    list[2] = -list[2];
    swap(list, 0, 2);
  }

  void transform6(List<double> list) {
    list[1] = -list[1];
    list[2] = -list[2];
  }

  void swap(List<double> list, int i, int j) {
    double temp = list[j];
    list[j] = list[i];
    list[i] = temp;
  }
}
