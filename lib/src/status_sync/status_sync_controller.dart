import 'package:cuber/cuber.dart' as cuber;
import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/handler/ble_data_handler.dart';
import 'package:cubestation_flutter/handler/cuber_handler.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

import 'status_box/status_box_controller.dart';

class StatusSyncController extends GetxController with GetSingleTickerProviderStateMixin {
  ColorModel UColorItem = ColorModel(UColor);
  ColorModel FColorItem = ColorModel(FColor);
  ColorModel DColorItem = ColorModel(DColor);
  ColorModel BColorItem = ColorModel(BColor);
  ColorModel RColorItem = ColorModel(RColor);
  ColorModel LColorItem = ColorModel(LColor);

  late Map<ColorModel, Widget> colorItems = {
    UColorItem: _selectColorItem(UColorItem),
    FColorItem: _selectColorItem(FColorItem),
    DColorItem: _selectColorItem(DColorItem),
    BColorItem: _selectColorItem(BColorItem),
    RColorItem: _selectColorItem(RColorItem),
    LColorItem: _selectColorItem(LColorItem),
  };
  late Rx<ColorModel> selectedSegment = FColorItem.obs;

  List<BoxModel> boxs = [];
  ZVector _rotate = const ZVector.only(x: -tau / 12, y: tau / 8);
  late AnimationController animationController;
  Animation? rotateYAnimation;
  Animation? rotateXAnimation;

  bool get isCompleted =>
      (UColorItem.num.value +
          FColorItem.num.value +
          DColorItem.num.value +
          BColorItem.num.value +
          RColorItem.num.value +
          LColorItem.num.value) ==
      0;
  var tips = '已选绿色，请点击魔方对应绿色块位置完成填充'.obs;

  late List<String> _cubeColors;

  @override
  void onInit() {
    animationController = AnimationController(vsync: this, duration: 0.5.seconds);
    rotateXAnimation = Tween(begin: _rotate.x, end: _rotate.x).animate(animationController);
    rotateYAnimation = Tween(begin: _rotate.y, end: _rotate.y).animate(animationController);
    initCubeStatus();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void turnLeft() {
    rotateXAnimation = Tween(begin: _rotate.x, end: _rotate.x).animate(animationController);
    rotateYAnimation =
        Tween(begin: _rotate.y, end: _rotate.y - tau / 4).animate(animationController);
    animationController
        .forward(from: 0)
        .whenComplete(() => _rotate = ZVector.only(x: _rotate.x, y: _rotate.y - tau / 4));
  }

  void turnRight() {
    rotateXAnimation = Tween(begin: _rotate.x, end: _rotate.x).animate(animationController);
    rotateYAnimation =
        Tween(begin: _rotate.y, end: _rotate.y + tau / 4).animate(animationController);
    animationController
        .forward(from: 0)
        .whenComplete(() => _rotate = ZVector.only(x: _rotate.x, y: _rotate.y + tau / 4));
  }

  void turnUpDown() {
    rotateXAnimation = Tween(begin: _rotate.x, end: -_rotate.x).animate(animationController);
    rotateYAnimation = Tween(begin: _rotate.y, end: _rotate.y).animate(animationController);
    animationController
        .forward(from: 0)
        .whenComplete(() => _rotate = ZVector.only(x: -_rotate.x, y: _rotate.y));
  }

  ///初始化魔方状态
  void initCubeStatus() {
    boxs.clear();
    for (BoxModel m in _initBoxs) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      boxs.add(newModel);
    }
  }

  void reset() {
    // initCubeStatus();
    // Get.find<StatusBoxController>().update(boxs.map((e) => e.id!).toList());
    boxs.clear();
    for (BoxModel m in _initBoxs) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      boxs.add(newModel);
      Get.find<StatusBoxController>().update([newModel.id!]);
    }
  }

  void onColorChanged(ColorModel? value) {
    if (value != null) {
      selectedSegment.value = value;
      print('_selectedSegment=${selectedSegment.value.color}');
    }
  }

  Widget _selectColorItem(ColorModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Column(
        children: [
          Card(
              color: model.color,
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: const SizedBox(width: 50, height: 50)),
          const SizedBox(height: 6),
          Obx(() => Text('x${model.num.value}'))
        ],
      ),
    );
  }

  void recoverCube() {
    String str =
        "00000101,00111001,01110111,00000000,00000000,00000001,00100011,01000101,01100111,10001001,10101011,00000000,00000000";
    List<int> valuelist = str.split(',').map((e) => int.parse(e, radix: 2)).toList();

    print('object=$valuelist');
    BleDataHandler().writeCubeResetApi(valuelist);
  }

  void solved() {
    BoxModel wgr = boxs.firstWhere((b) => b.id == BoxName.WGR);
    wgr.frontColor = FColor;
    wgr.topColor = UColor;
    wgr.rightColor = RColor;
    BoxModel wgo = boxs.firstWhere((b) => b.id == BoxName.WGO);
    wgo.frontColor = FColor;
    wgo.topColor = UColor;
    wgo.leftColor = LColor;
    BoxModel wob = boxs.firstWhere((b) => b.id == BoxName.WOB);
    wob.rearColor = BColor;
    wob.topColor = UColor;
    wob.leftColor = LColor;
    BoxModel wrb = boxs.firstWhere((b) => b.id == BoxName.WRB);
    wrb.rearColor = BColor;
    wrb.topColor = UColor;
    wrb.rightColor = RColor;
    BoxModel ygr = boxs.firstWhere((b) => b.id == BoxName.YGR);
    ygr.frontColor = FColor;
    ygr.bottomColor = DColor;
    ygr.rightColor = RColor;
    BoxModel yog = boxs.firstWhere((b) => b.id == BoxName.YOG);
    yog.frontColor = FColor;
    yog.bottomColor = DColor;
    yog.leftColor = LColor;
    BoxModel yob = boxs.firstWhere((b) => b.id == BoxName.YOB);
    yob.rearColor = BColor;
    yob.bottomColor = DColor;
    yob.leftColor = LColor;
    BoxModel yrb = boxs.firstWhere((b) => b.id == BoxName.YRB);
    yrb.rearColor = BColor;
    yrb.bottomColor = DColor;
    yrb.rightColor = RColor;
    BoxModel wg = boxs.firstWhere((b) => b.id == BoxName.WG);
    wg.frontColor = FColor;
    wg.topColor = UColor;
    BoxModel wo = boxs.firstWhere((b) => b.id == BoxName.WO);
    wo.leftColor = LColor;
    wo.topColor = UColor;
    BoxModel wb = boxs.firstWhere((b) => b.id == BoxName.WB);
    wb.rearColor = BColor;
    wb.topColor = UColor;
    BoxModel wr = boxs.firstWhere((b) => b.id == BoxName.WR);
    wr.rightColor = RColor;
    wr.topColor = UColor;
    BoxModel yg = boxs.firstWhere((b) => b.id == BoxName.YG);
    yg.frontColor = FColor;
    yg.bottomColor = DColor;
    BoxModel yo = boxs.firstWhere((b) => b.id == BoxName.YO);
    yo.leftColor = LColor;
    yo.bottomColor = DColor;
    BoxModel yb = boxs.firstWhere((b) => b.id == BoxName.YB);
    yb.rearColor = BColor;
    yb.bottomColor = DColor;
    BoxModel yr = boxs.firstWhere((b) => b.id == BoxName.YR);
    yr.rightColor = RColor;
    yr.bottomColor = DColor;
    BoxModel gr = boxs.firstWhere((b) => b.id == BoxName.GR);
    gr.frontColor = FColor;
    gr.rightColor = RColor;
    BoxModel go = boxs.firstWhere((b) => b.id == BoxName.GO);
    go.frontColor = FColor;
    go.leftColor = LColor;
    BoxModel bo = boxs.firstWhere((b) => b.id == BoxName.BO);
    bo.rearColor = BColor;
    bo.leftColor = LColor;
    BoxModel br = boxs.firstWhere((b) => b.id == BoxName.BR);
    br.rearColor = BColor;
    br.rightColor = RColor;

    Get.find<StatusBoxController>().update(boxs.map((e) => e.id!).toList());
    UColorItem.num.value = 0;
    DColorItem.num.value = 0;
    LColorItem.num.value = 0;
    RColorItem.num.value = 0;
    FColorItem.num.value = 0;
    BColorItem.num.value = 0;
  }

  void sync() {
    _initCubeColors();
    List<BoxModel> cors = boxs.getRange(6, 14).toList();
    for (int i = 0; i < 8; i++) {
      BoxModel cor = cors[i];
      _getCornerColor(i, cor);
    }

    List<BoxModel> edges = boxs.getRange(14, 26).toList();
    for (int i = 0; i < 12; i++) {
      BoxModel edge = edges[i];
      _getEdgeColor(i, edge);
    }
    final cuber.Cube cube = cuber.Cube.from(_cubeColors.join(''));
    if (cube.isNotOk) {
      Fluttertoast.showToast(msg: '魔方状态有误，请检查');
      return;
    }
    List props = cube.props;
    List<String> list = [];
    for (cuber.Corner cp in props[0]) {
      list.add(_corMap[cp]!);
    }
    for (int co in props[1]) {
      list.add(co.toRadixString(2).padLeft(2, '0'));
    }
    for (cuber.Edge ep in props[2]) {
      list.add(_edgeMap[ep]!);
    }
    for (int eo in props[3]) {
      list.add(eo.toString());
    }
    list.add('0000');
    print(list);
    List<String> str = list.join().split('');

    List<int> valuelist = [];
    for (int i = 0; i < str.length; i++) {
      valuelist.add(int.parse(str.getRange(i, i + 8).join(), radix: 2));
      i += 7;
    }

    print('valuelist=$valuelist');
    //同步魔方状态
    BleDataHandler().writeCubeResetApi(valuelist);
  }

  void _initCubeColors() {
    _cubeColors = List.generate(54, (index) => '', growable: false);
    _cubeColors[4] = U;
    _cubeColors[13] = R;
    _cubeColors[22] = F;
    _cubeColors[31] = D;
    _cubeColors[40] = L;
    _cubeColors[49] = B;
  }

  void _getCornerColor(int i, BoxModel boxModel) {
    switch (i) {
      case 0:
        _cubeColors[8] = letterByColor[boxModel.topColor]!;
        _cubeColors[20] = letterByColor[boxModel.frontColor]!;
        _cubeColors[9] = letterByColor[boxModel.rightColor]!;
        break;
      case 1:
        _cubeColors[6] = letterByColor[boxModel.topColor]!;
        _cubeColors[18] = letterByColor[boxModel.frontColor]!;
        _cubeColors[38] = letterByColor[boxModel.leftColor]!;
        break;
      case 2:
        _cubeColors[0] = letterByColor[boxModel.topColor]!;
        _cubeColors[36] = letterByColor[boxModel.leftColor]!;
        _cubeColors[47] = letterByColor[boxModel.rearColor]!;
        break;
      case 3:
        _cubeColors[2] = letterByColor[boxModel.topColor]!;
        _cubeColors[11] = letterByColor[boxModel.rightColor]!;
        _cubeColors[45] = letterByColor[boxModel.rearColor]!;
        break;
      case 4:
        _cubeColors[26] = letterByColor[boxModel.frontColor]!;
        _cubeColors[15] = letterByColor[boxModel.rightColor]!;
        _cubeColors[29] = letterByColor[boxModel.bottomColor]!;
        break;
      case 5:
        _cubeColors[24] = letterByColor[boxModel.frontColor]!;
        _cubeColors[44] = letterByColor[boxModel.leftColor]!;
        _cubeColors[27] = letterByColor[boxModel.bottomColor]!;
        break;
      case 6:
        _cubeColors[53] = letterByColor[boxModel.rearColor]!;
        _cubeColors[42] = letterByColor[boxModel.leftColor]!;
        _cubeColors[33] = letterByColor[boxModel.bottomColor]!;
        break;
      case 7:
        _cubeColors[51] = letterByColor[boxModel.rearColor]!;
        _cubeColors[17] = letterByColor[boxModel.rightColor]!;
        _cubeColors[35] = letterByColor[boxModel.bottomColor]!;
        break;
      default:
    }
  }

  void _getEdgeColor(int i, BoxModel boxModel) {
    switch (i) {
      case 0:
        _cubeColors[5] = letterByColor[boxModel.topColor]!;
        _cubeColors[10] = letterByColor[boxModel.rightColor]!;
        break;
      case 1:
        _cubeColors[7] = letterByColor[boxModel.topColor]!;
        _cubeColors[19] = letterByColor[boxModel.frontColor]!;
        break;
      case 2:
        _cubeColors[3] = letterByColor[boxModel.topColor]!;
        _cubeColors[37] = letterByColor[boxModel.leftColor]!;
        break;
      case 3:
        _cubeColors[1] = letterByColor[boxModel.topColor]!;
        _cubeColors[46] = letterByColor[boxModel.rearColor]!;
        break;
      case 4:
        _cubeColors[16] = letterByColor[boxModel.rightColor]!;
        _cubeColors[32] = letterByColor[boxModel.bottomColor]!;
        break;
      case 5:
        _cubeColors[25] = letterByColor[boxModel.frontColor]!;
        _cubeColors[28] = letterByColor[boxModel.bottomColor]!;
        break;
      case 6:
        _cubeColors[43] = letterByColor[boxModel.leftColor]!;
        _cubeColors[30] = letterByColor[boxModel.bottomColor]!;
        break;
      case 7:
        _cubeColors[52] = letterByColor[boxModel.rearColor]!;
        _cubeColors[34] = letterByColor[boxModel.bottomColor]!;
        break;
      case 8:
        _cubeColors[23] = letterByColor[boxModel.frontColor]!;
        _cubeColors[12] = letterByColor[boxModel.rightColor]!;
        break;
      case 9:
        _cubeColors[21] = letterByColor[boxModel.frontColor]!;
        _cubeColors[41] = letterByColor[boxModel.leftColor]!;
        break;
      case 10:
        _cubeColors[50] = letterByColor[boxModel.rearColor]!;
        _cubeColors[39] = letterByColor[boxModel.leftColor]!;
        break;
      case 11:
        _cubeColors[48] = letterByColor[boxModel.rearColor]!;
        _cubeColors[14] = letterByColor[boxModel.rightColor]!;
        break;
      default:
    }
  }

  final List<BoxModel> _initBoxs = [
    //面
    BoxModel(
        order: 0, id: BoxName.G, translate: const ZVector.only(z: boxOffset), frontColor: FColor),
    BoxModel(
        order: 1, id: BoxName.B, translate: const ZVector.only(z: -boxOffset), rearColor: BColor),
    BoxModel(
        order: 2, id: BoxName.Y, translate: const ZVector.only(y: boxOffset), bottomColor: DColor),
    BoxModel(
        order: 3, id: BoxName.W, translate: const ZVector.only(y: -boxOffset), topColor: UColor),
    BoxModel(
        order: 4, id: BoxName.R, translate: const ZVector.only(x: boxOffset), rightColor: RColor),
    BoxModel(
        order: 5, id: BoxName.O, translate: const ZVector.only(x: -boxOffset), leftColor: LColor),

    //角块
    BoxModel(
      order: 0,
      id: BoxName.WGR,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      topColor: defaultSliceColor,
    ),
    BoxModel(
      order: 1,
      id: BoxName.WGO,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      topColor: defaultSliceColor,
    ),
    BoxModel(
      order: 2,
      id: BoxName.WOB,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      topColor: defaultSliceColor,
    ),
    BoxModel(
      order: 3,
      id: BoxName.WRB,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      topColor: defaultSliceColor,
    ),
    BoxModel(
      order: 4,
      id: BoxName.YGR,
      translate: const ZVector.only(x: boxOffset, y: boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
    ),
    BoxModel(
      order: 5,
      id: BoxName.YOG,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
    ),
    BoxModel(
      order: 6,
      id: BoxName.YOB,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      leftColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
    ),
    BoxModel(
      order: 7,
      id: BoxName.YRB,
      translate: const ZVector.only(x: boxOffset, y: boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      rightColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
    ),

    //楞块
    BoxModel(
      order: 0,
      id: BoxName.WR,
      translate: const ZVector.only(x: boxOffset, y: -boxOffset),
      topColor: defaultSliceColor,
      rightColor: defaultSliceColor,
    ),
    BoxModel(
      order: 1,
      id: BoxName.WG,
      translate: const ZVector.only(y: -boxOffset, z: boxOffset),
      topColor: defaultSliceColor,
      frontColor: defaultSliceColor,
    ),
    BoxModel(
      order: 2,
      id: BoxName.WO,
      translate: const ZVector.only(x: -boxOffset, y: -boxOffset),
      topColor: defaultSliceColor,
      leftColor: defaultSliceColor,
    ),
    BoxModel(
      order: 3,
      id: BoxName.WB,
      translate: const ZVector.only(y: -boxOffset, z: -boxOffset),
      topColor: defaultSliceColor,
      rearColor: defaultSliceColor,
    ),
    BoxModel(
      order: 4,
      id: BoxName.YR,
      translate: const ZVector.only(x: boxOffset, y: boxOffset),
      bottomColor: defaultSliceColor,
      rightColor: defaultSliceColor,
    ),
    BoxModel(
      order: 5,
      id: BoxName.YG,
      translate: const ZVector.only(y: boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
    ),
    BoxModel(
      order: 6,
      id: BoxName.YO,
      translate: const ZVector.only(x: -boxOffset, y: boxOffset),
      leftColor: defaultSliceColor,
      bottomColor: defaultSliceColor,
    ),
    BoxModel(
      order: 7,
      id: BoxName.YB,
      translate: const ZVector.only(y: boxOffset, z: -boxOffset),
      bottomColor: defaultSliceColor,
      rearColor: defaultSliceColor,
    ),
    BoxModel(
      order: 8,
      id: BoxName.GR,
      translate: const ZVector.only(x: boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      rightColor: defaultSliceColor,
    ),
    BoxModel(
      order: 9,
      id: BoxName.GO,
      translate: const ZVector.only(x: -boxOffset, z: boxOffset),
      frontColor: defaultSliceColor,
      leftColor: defaultSliceColor,
    ),
    BoxModel(
      order: 10,
      id: BoxName.BO,
      translate: const ZVector.only(x: -boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      leftColor: defaultSliceColor,
    ),
    BoxModel(
      order: 11,
      id: BoxName.BR,
      translate: const ZVector.only(x: boxOffset, z: -boxOffset),
      rearColor: defaultSliceColor,
      rightColor: defaultSliceColor,
    ),
  ];

  final Map<cuber.Corner, String> _corMap = {
    cuber.Corner.upRightFront: '000',
    cuber.Corner.upFrontLeft: '001',
    cuber.Corner.upLeftBottom: '010',
    cuber.Corner.upBottomRight: '011',
    cuber.Corner.downFrontRight: '100',
    cuber.Corner.downLeftFront: '101',
    cuber.Corner.downBottomLeft: '110',
    cuber.Corner.downRightBottom: '111',
  };

  final Map<cuber.Edge, String> _edgeMap = {
    cuber.Edge.upRight: '0000',
    cuber.Edge.upFront: '0001',
    cuber.Edge.upLeft: '0010',
    cuber.Edge.upBottom: '0011',
    cuber.Edge.downRight: '0100',
    cuber.Edge.downFront: '0101',
    cuber.Edge.downLeft: '0110',
    cuber.Edge.downBottom: '0111',
    cuber.Edge.frontRight: '1000',
    cuber.Edge.frontLeft: '1001',
    cuber.Edge.bottomLeft: '1010',
    cuber.Edge.bottomRight: '1011',
  };
}

class ColorModel {
  Color color;
  var num = 8.obs;

  ColorModel(this.color);
}
