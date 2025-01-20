import 'dart:math';

import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'box/box_model.dart';
import 'package:cuber/cuber.dart' as cuber;

// const int rotateSliceDuration = 50;
const int rotateSliceDuration = 1000;

const Color UColor = Colors.white;
const Color RColor = Color(0xFFD82020);
const Color FColor = Color(0xFF02B613);
const Color DColor = Color(0xFFECF035);
const Color LColor = Color(0xFFFF6B00);
const Color BColor = Color(0xFF0061F2);

class BoxName {
  //面
  static const String R = 'R';
  static const String G = 'G';
  static const String B = 'B';
  static const String Y = 'Y';
  static const String O = 'O';
  static const String W = 'W';
  //角块
  static const String WGR = 'WGR';
  static const String WGO = 'WGO';
  static const String WOB = 'WOB';
  static const String WRB = 'WRB';
  static const String YGR = 'YGR';
  static const String YOG = 'YOG';
  static const String YOB = 'YOB';
  static const String YRB = 'YRB';
  //楞块
  static const String WR = 'WR';
  static const String WG = 'WG';
  static const String WO = 'WO';
  static const String WB = 'WB';
  static const String YR = 'YR';
  static const String YG = 'YG';
  static const String YO = 'YO';
  static const String YB = 'YB';
  static const String GR = 'GR';
  static const String GO = 'GO';
  static const String BO = 'BO';
  static const String BR = 'BR';
}

class CubeDirection {
  ///顺时针
  static const int clockwise = 0;

  ///逆时针
  static const int antiClockwise = 1;
}

//90度旋转矩阵顺时针
vector.Matrix3 xMatrix = vector.Matrix3(1, 0, 0, 0, 0, -1, 0, 1, 0);
vector.Matrix3 yMatrix = vector.Matrix3(0, 0, 1, 0, 1, 0, -1, 0, 0);
vector.Matrix3 zMatrix = vector.Matrix3(0, -1, 0, 1, 0, 0, 0, 0, 1);
//90度旋转矩阵逆时针
vector.Matrix3 nxMatrix = vector.Matrix3(1, 0, 0, 0, 0, 1, 0, -1, 0);
vector.Matrix3 nyMatrix = vector.Matrix3(0, 0, -1, 0, 1, 0, 1, 0, 0);
vector.Matrix3 nzMatrix = vector.Matrix3(0, 1, 0, -1, 0, 0, 0, 0, 1);

//右手坐标系转左手坐标系旋转矩阵
vector.Matrix3 rToLMatrix = vector.Matrix3(1, 0, 0, 0, 0, -1, 0, 1, 0);
//静止矩阵参数，绕x和y轴倾斜30度
vector.Matrix3 staticMatrix = vector.Matrix3(
    sqrt(3) / 2, 0, -0.5, 0.25, sqrt(3) / 2, sqrt(3) / 4, sqrt(3) / 4, -0.5, sqrt(3) / 4);

List<ZVector> corPositions = [
  const ZVector(boxOffset, -boxOffset, boxOffset),
  const ZVector(-boxOffset, -boxOffset, boxOffset),
  const ZVector(-boxOffset, -boxOffset, -boxOffset),
  const ZVector(boxOffset, -boxOffset, -boxOffset),
  const ZVector(boxOffset, boxOffset, boxOffset),
  const ZVector(-boxOffset, boxOffset, boxOffset),
  const ZVector(-boxOffset, boxOffset, -boxOffset),
  const ZVector(boxOffset, boxOffset, -boxOffset)
];

List<ZVector> edgePositions = [
  const ZVector(boxOffset, -boxOffset, 0),
  const ZVector(0, -boxOffset, boxOffset),
  const ZVector(-boxOffset, -boxOffset, 0),
  const ZVector(0, -boxOffset, -boxOffset),
  const ZVector(boxOffset, boxOffset, 0),
  const ZVector(0, boxOffset, boxOffset),
  const ZVector(-boxOffset, boxOffset, 0),
  const ZVector(0, boxOffset, -boxOffset),
  const ZVector(boxOffset, 0, boxOffset),
  const ZVector(-boxOffset, 0, boxOffset),
  const ZVector(-boxOffset, 0, -boxOffset),
  const ZVector(boxOffset, 0, -boxOffset),
];

List<BoxModel> solvedList = [
  //面
  BoxModel(
      order: 0, id: BoxName.G, translate: const ZVector.only(z: boxOffset), frontColor: FColor),
  BoxModel(
      order: 1, id: BoxName.B, translate: const ZVector.only(z: -boxOffset), rearColor: BColor),
  BoxModel(
      order: 2, id: BoxName.Y, translate: const ZVector.only(y: boxOffset), bottomColor: DColor),
  BoxModel(order: 3, id: BoxName.W, translate: const ZVector.only(y: -boxOffset), topColor: UColor),
  BoxModel(
      order: 4, id: BoxName.R, translate: const ZVector.only(x: boxOffset), rightColor: RColor),
  BoxModel(
      order: 5, id: BoxName.O, translate: const ZVector.only(x: -boxOffset), leftColor: LColor),

  //角块
  BoxModel(
      order: 0,
      id: BoxName.WGR,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset, z: boxOffset),
      frontColor: FColor,
      rightColor: RColor,
      topColor: UColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [2, 3, 1],
        [3, 1, 2]
      ],
      colorMap: {
        1: RColor,
        -1: defaultColor,
        2: UColor,
        -2: defaultColor,
        3: FColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 1,
      id: BoxName.WGO,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset, z: boxOffset),
      frontColor: FColor,
      leftColor: LColor,
      topColor: UColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-3, -1, 2],
        [-2, 3, -1]
      ],
      colorMap: {
        1: defaultColor,
        -1: LColor,
        2: UColor,
        -2: defaultColor,
        3: FColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 2,
      id: BoxName.WOB,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset, z: -boxOffset),
      rearColor: BColor,
      leftColor: LColor,
      topColor: UColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-2, -3, 1],
        [3, -1, -2]
      ],
      colorMap: {
        1: defaultColor,
        -1: LColor,
        2: UColor,
        -2: defaultColor,
        3: defaultColor,
        -3: BColor
      }),
  BoxModel(
      order: 3,
      id: BoxName.WRB,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset, z: -boxOffset),
      rearColor: BColor,
      rightColor: RColor,
      topColor: UColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-3, 1, -2],
        [2, -3, -1]
      ],
      colorMap: {
        1: RColor,
        -1: defaultColor,
        2: UColor,
        -2: defaultColor,
        3: defaultColor,
        -3: BColor
      }),
  BoxModel(
      order: 4,
      id: BoxName.YGR,
      translate: const ZVector.only(x: boxOffset, y: boxOffset, z: boxOffset),
      frontColor: FColor,
      rightColor: RColor,
      bottomColor: DColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [3, -1, -2],
        [-2, -3, 1]
      ],
      colorMap: {
        1: RColor,
        -1: defaultColor,
        2: defaultColor,
        -2: DColor,
        3: FColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 5,
      id: BoxName.YOG,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset, z: boxOffset),
      frontColor: FColor,
      leftColor: LColor,
      bottomColor: DColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [2, -3, -1],
        [-3, 1, -2]
      ],
      colorMap: {
        1: defaultColor,
        -1: LColor,
        2: defaultColor,
        -2: DColor,
        3: FColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 6,
      id: BoxName.YOB,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset, z: -boxOffset),
      rearColor: BColor,
      leftColor: LColor,
      bottomColor: DColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [3, 1, 2],
        [2, 3, 1]
      ],
      colorMap: {
        1: defaultColor,
        -1: LColor,
        2: defaultColor,
        -2: DColor,
        3: defaultColor,
        -3: BColor
      }),
  BoxModel(
      order: 7,
      id: BoxName.YRB,
      translate: const ZVector.only(x: boxOffset, y: boxOffset, z: -boxOffset),
      rearColor: BColor,
      rightColor: RColor,
      bottomColor: DColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-2, 3, -1],
        [-3, -1, 2]
      ],
      colorMap: {
        1: RColor,
        -1: defaultColor,
        2: defaultColor,
        -2: DColor,
        3: defaultColor,
        -3: BColor
      }),

  //楞块
  BoxModel(
      order: 0,
      id: BoxName.WR,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset),
      topColor: UColor,
      rightColor: RColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [2, 1, -3]
      ],
      colorMap: {
        1: RColor,
        -1: defaultColor,
        2: UColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 1,
      id: BoxName.WG,
      translate: const ZVector.only(y: -boxOffset, z: boxOffset),
      topColor: UColor,
      frontColor: FColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-1, 3, 2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultColor,
        2: UColor,
        -2: defaultColor,
        3: FColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 2,
      id: BoxName.WO,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset),
      topColor: UColor,
      leftColor: LColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-2, -1, -3]
      ],
      colorMap: {
        1: defaultColor,
        -1: LColor,
        2: UColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 3,
      id: BoxName.WB,
      translate: const ZVector.only(y: -boxOffset, z: -boxOffset),
      topColor: UColor,
      rearColor: BColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-1, -3, -2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultColor,
        2: UColor,
        -2: defaultColor,
        3: defaultColor,
        -3: BColor
      }),
  BoxModel(
      order: 4,
      id: BoxName.YR,
      translate: const ZVector.only(x: boxOffset, y: boxOffset),
      bottomColor: DColor,
      rightColor: RColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-2, -1, -3]
      ],
      colorMap: {
        1: RColor,
        -1: defaultColor,
        2: defaultColor,
        -2: DColor,
        3: defaultColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 5,
      id: BoxName.YG,
      translate: const ZVector.only(y: boxOffset, z: boxOffset),
      frontColor: FColor,
      bottomColor: DColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-1, -3, -2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultColor,
        2: defaultColor,
        -2: DColor,
        3: FColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 6,
      id: BoxName.YO,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset),
      leftColor: LColor,
      bottomColor: DColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [2, 1, -3]
      ],
      colorMap: {
        1: defaultColor,
        -1: LColor,
        2: defaultColor,
        -2: DColor,
        3: defaultColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 7,
      id: BoxName.YB,
      translate: const ZVector.only(y: boxOffset, z: -boxOffset),
      bottomColor: DColor,
      rearColor: BColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-1, 3, 2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultColor,
        2: defaultColor,
        -2: DColor,
        3: defaultColor,
        -3: BColor
      }),
  BoxModel(
      order: 8,
      id: BoxName.GR,
      translate: const ZVector.only(x: boxOffset, z: boxOffset),
      frontColor: FColor,
      rightColor: RColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [3, -2, 1]
      ],
      colorMap: {
        1: RColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultColor,
        3: FColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 9,
      id: BoxName.GO,
      translate: const ZVector.only(x: -boxOffset, z: boxOffset),
      frontColor: FColor,
      leftColor: LColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-3, -2, -1]
      ],
      colorMap: {
        1: defaultColor,
        -1: LColor,
        2: defaultColor,
        -2: defaultColor,
        3: FColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 10,
      id: BoxName.BO,
      translate: const ZVector.only(x: -boxOffset, z: -boxOffset),
      rearColor: BColor,
      leftColor: LColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [3, -2, 1]
      ],
      colorMap: {
        1: defaultColor,
        -1: LColor,
        2: defaultColor,
        -2: defaultColor,
        3: defaultColor,
        -3: BColor
      }),
  BoxModel(
      order: 11,
      id: BoxName.BR,
      translate: const ZVector.only(x: boxOffset, z: -boxOffset),
      rearColor: BColor,
      rightColor: RColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-3, -2, -1]
      ],
      colorMap: {
        1: RColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultColor,
        3: defaultColor,
        -3: BColor
      }),
];

List<BoxModel> colorLessCube = [
  //中心块
  BoxModel(
      order: 0,
      id: BoxName.G,
      translate: const ZVector.only(z: boxOffset),
      frontColor: defaultSliceColor),
  BoxModel(
      order: 1,
      id: BoxName.B,
      translate: const ZVector.only(z: -boxOffset),
      rearColor: defaultSliceColor),
  BoxModel(
      order: 2,
      id: BoxName.Y,
      translate: const ZVector.only(y: boxOffset),
      bottomColor: defaultSliceColor),
  BoxModel(
      order: 3,
      id: BoxName.W,
      translate: const ZVector.only(y: -boxOffset),
      topColor: defaultSliceColor),
  BoxModel(
      order: 4,
      id: BoxName.R,
      translate: const ZVector.only(x: boxOffset),
      rightColor: defaultSliceColor),
  BoxModel(
      order: 5,
      id: BoxName.O,
      translate: const ZVector.only(x: -boxOffset),
      leftColor: defaultSliceColor),

  //角块
  BoxModel(
      order: 0,
      id: BoxName.WGR,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      topColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [2, 3, 1],
        [3, 1, 2]
      ],
      colorMap: {
        1: defaultSliceColor,
        -1: defaultColor,
        2: defaultSliceColor,
        -2: defaultColor,
        3: defaultSliceColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 1,
      id: BoxName.WGO,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      topColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-3, -1, 2],
        [-2, 3, -1]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultSliceColor,
        2: defaultSliceColor,
        -2: defaultColor,
        3: defaultSliceColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 2,
      id: BoxName.WOB,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      topColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-2, -3, 1],
        [3, -1, -2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultSliceColor,
        2: defaultSliceColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultSliceColor
      }),
  BoxModel(
      order: 3,
      id: BoxName.WRB,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      topColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-3, 1, -2],
        [2, -3, -1]
      ],
      colorMap: {
        1: defaultSliceColor,
        -1: defaultColor,
        2: defaultSliceColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultSliceColor
      }),
  BoxModel(
      order: 4,
      id: BoxName.YGR,
      translate: const ZVector.only(x: boxOffset, y: boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [3, -1, -2],
        [-2, -3, 1]
      ],
      colorMap: {
        1: defaultSliceColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultSliceColor,
        3: defaultSliceColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 5,
      id: BoxName.YOG,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [2, -3, -1],
        [-3, 1, -2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultSliceColor,
        2: defaultColor,
        -2: defaultSliceColor,
        3: defaultSliceColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 6,
      id: BoxName.YOB,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [3, 1, 2],
        [2, 3, 1]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultSliceColor,
        2: defaultColor,
        -2: defaultSliceColor,
        3: defaultColor,
        -3: defaultSliceColor
      }),
  BoxModel(
      order: 7,
      id: BoxName.YRB,
      translate: const ZVector.only(x: boxOffset, y: boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-2, 3, -1],
        [-3, -1, 2]
      ],
      colorMap: {
        1: defaultSliceColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultSliceColor,
        3: defaultColor,
        -3: defaultSliceColor
      }),

  //楞块
  BoxModel(
      order: 0,
      id: BoxName.WR,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset),
      topColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [2, 1, -3]
      ],
      colorMap: {
        1: defaultSliceColor,
        -1: defaultColor,
        2: defaultSliceColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 1,
      id: BoxName.WG,
      translate: const ZVector.only(y: -boxOffset, z: boxOffset),
      topColor: defaultSliceColor,
      frontColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-1, 3, 2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultColor,
        2: defaultSliceColor,
        -2: defaultColor,
        3: defaultSliceColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 2,
      id: BoxName.WO,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset),
      topColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-2, -1, -3]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultSliceColor,
        2: defaultSliceColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 3,
      id: BoxName.WB,
      translate: const ZVector.only(y: -boxOffset, z: -boxOffset),
      topColor: defaultSliceColor,
      rearColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-1, -3, -2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultColor,
        2: defaultSliceColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultSliceColor
      }),
  BoxModel(
      order: 4,
      id: BoxName.YR,
      translate: const ZVector.only(x: boxOffset, y: boxOffset),
      bottomColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-2, -1, -3]
      ],
      colorMap: {
        1: defaultSliceColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultSliceColor,
        3: defaultColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 5,
      id: BoxName.YG,
      translate: const ZVector.only(y: boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-1, -3, -2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultSliceColor,
        3: defaultSliceColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 6,
      id: BoxName.YO,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset),
      leftColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [2, 1, -3]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultSliceColor,
        2: defaultColor,
        -2: defaultSliceColor,
        3: defaultColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 7,
      id: BoxName.YB,
      translate: const ZVector.only(y: boxOffset, z: -boxOffset),
      bottomColor: defaultSliceColor,
      rearColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-1, 3, 2]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultSliceColor,
        3: defaultColor,
        -3: defaultSliceColor
      }),
  BoxModel(
      order: 8,
      id: BoxName.GR,
      translate: const ZVector.only(x: boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [3, -2, 1]
      ],
      colorMap: {
        1: defaultSliceColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultColor,
        3: defaultSliceColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 9,
      id: BoxName.GO,
      translate: const ZVector.only(x: -boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-3, -2, -1]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultSliceColor,
        2: defaultColor,
        -2: defaultColor,
        3: defaultSliceColor,
        -3: defaultColor
      }),
  BoxModel(
      order: 10,
      id: BoxName.BO,
      translate: const ZVector.only(x: -boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [3, -2, 1]
      ],
      colorMap: {
        1: defaultColor,
        -1: defaultSliceColor,
        2: defaultColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultSliceColor
      }),
  BoxModel(
      order: 11,
      id: BoxName.BR,
      translate: const ZVector.only(x: boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      direction: [
        1,
        2,
        3
      ],
      directionMap: [
        [1, 2, 3],
        [-3, -2, -1]
      ],
      colorMap: {
        1: defaultSliceColor,
        -1: defaultColor,
        2: defaultColor,
        -2: defaultColor,
        3: defaultColor,
        -3: defaultSliceColor
      }),
];

List<BoxModel> initCube = [
  //中心块
  BoxModel(translate: const ZVector.only(z: boxOffset), frontColor: FColor),
  BoxModel(translate: const ZVector.only(z: -boxOffset), rearColor: BColor),
  BoxModel(translate: const ZVector.only(y: boxOffset), bottomColor: DColor),
  BoxModel(translate: const ZVector.only(y: -boxOffset), topColor: UColor),
  BoxModel(translate: const ZVector.only(x: boxOffset), rightColor: RColor),
  BoxModel(translate: const ZVector.only(x: -boxOffset), leftColor: LColor),

  //角块
  BoxModel(translate: const ZVector.only(x: boxOffset, y: -boxOffset, z: boxOffset)),
  BoxModel(translate: const ZVector.only(x: -boxOffset, y: -boxOffset, z: boxOffset)),
  BoxModel(translate: const ZVector.only(x: -boxOffset, y: -boxOffset, z: -boxOffset)),
  BoxModel(translate: const ZVector.only(x: boxOffset, y: -boxOffset, z: -boxOffset)),
  BoxModel(translate: const ZVector.only(x: boxOffset, y: boxOffset, z: boxOffset)),
  BoxModel(translate: const ZVector.only(x: -boxOffset, y: boxOffset, z: boxOffset)),
  BoxModel(translate: const ZVector.only(x: -boxOffset, y: boxOffset, z: -boxOffset)),
  BoxModel(translate: const ZVector.only(x: boxOffset, y: boxOffset, z: -boxOffset)),

  //楞块
  BoxModel(translate: const ZVector.only(x: boxOffset, y: -boxOffset)),
  BoxModel(translate: const ZVector.only(y: -boxOffset, z: boxOffset)),
  BoxModel(translate: const ZVector.only(x: -boxOffset, y: -boxOffset)),
  BoxModel(translate: const ZVector.only(y: -boxOffset, z: -boxOffset)),
  BoxModel(translate: const ZVector.only(x: boxOffset, y: boxOffset)),
  BoxModel(translate: const ZVector.only(y: boxOffset, z: boxOffset)),
  BoxModel(translate: const ZVector.only(x: -boxOffset, y: boxOffset)),
  BoxModel(translate: const ZVector.only(y: boxOffset, z: -boxOffset)),
  BoxModel(translate: const ZVector.only(x: boxOffset, z: boxOffset)),
  BoxModel(translate: const ZVector.only(x: -boxOffset, z: boxOffset)),
  BoxModel(translate: const ZVector.only(x: -boxOffset, z: -boxOffset)),
  BoxModel(translate: const ZVector.only(x: boxOffset, z: -boxOffset)),
];

const String U = "U";
const String U_ = "U'";
const String D = "D";
const String D_ = "D'";
const String F = "F";
const String F_ = "F'";
const String B = "B";
const String B_ = "B'";
const String L = "L";
const String L_ = "L'";
const String R = "R";
const String R_ = "R'";

const String X = "X";
const String X_ = "X'";
const String Y = "Y";
const String Y_ = "Y'";
const String Z = "Z";
const String Z_ = "Z'";

Map<Color, String> letterByColor = {
  UColor: U,
  RColor: R,
  FColor: F,
  DColor: D,
  LColor: L,
  BColor: B
};
Map<String, Color> colorByLetter = {
  U: UColor,
  R: RColor,
  F: FColor,
  D: DColor,
  L: LColor,
  B: BColor
};

final Map<String, cuber.Corner> corMap = {
  '000': cuber.Corner.upRightFront,
  '001': cuber.Corner.upFrontLeft,
  '010': cuber.Corner.upLeftBottom,
  '011': cuber.Corner.upBottomRight,
  '100': cuber.Corner.downFrontRight,
  '101': cuber.Corner.downLeftFront,
  '110': cuber.Corner.downBottomLeft,
  '111': cuber.Corner.downRightBottom,
};

final Map<String, cuber.Edge> edgeMap = {
  '0000': cuber.Edge.upRight,
  '0001': cuber.Edge.upFront,
  '0010': cuber.Edge.upLeft,
  '0011': cuber.Edge.upBottom,
  '0100': cuber.Edge.downRight,
  '0101': cuber.Edge.downFront,
  '0110': cuber.Edge.downLeft,
  '0111': cuber.Edge.downBottom,
  '1000': cuber.Edge.frontRight,
  '1001': cuber.Edge.frontLeft,
  '1010': cuber.Edge.bottomLeft,
  '1011': cuber.Edge.bottomRight,
};
