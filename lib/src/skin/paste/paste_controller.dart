import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

class PasteController extends GetxController with GetSingleTickerProviderStateMixin {
  final List<String> UImages = [
    'assets/WhiteFace_WYH.png',
    'assets/WhiteFace_CQX.png',
    'assets/WhiteFace_XRH.png',
    'assets/WhiteFace_FS.png',
    'assets/WhiteFace_WYH2.png',
    'assets/li_blue.png',
    'assets/qian_blue.png',
    'assets/sun_blue.png',
    'assets/wu_blue.png',
    'assets/zhao_blue.png',
    'assets/zhou_blue.png',
  ];
  final List<String> FImages = [
    'assets/comn_WYH.png',
    'assets/comn_CQX.png',
    'assets/comn_XRH.png',
    'assets/comn_FS.png',
    'assets/comn_WYH2.png',
    'assets/li_white.png',
    'assets/qian_white.png',
    'assets/sun_white.png',
    'assets/wu_white.png',
    'assets/zhao_white.png',
    'assets/zhou_white.png',
  ];
  final List<String> DImages = [
    'assets/comn_WYH.png',
    'assets/comn_CQX.png',
    'assets/comn_XRH.png',
    'assets/comn_FS.png',
    'assets/comn_WYH2.png',
    'assets/li_white.png',
    'assets/qian_white.png',
    'assets/sun_white.png',
    'assets/wu_white.png',
    'assets/zhao_white.png',
    'assets/zhou_white.png',
  ];
  final List<String> BImages = [
    'assets/comn_WYH.png',
    'assets/comn_CQX.png',
    'assets/comn_XRH.png',
    'assets/comn_FS.png',
    'assets/comn_WYH2.png',
    'assets/li_white.png',
    'assets/qian_white.png',
    'assets/sun_white.png',
    'assets/wu_white.png',
    'assets/zhao_white.png',
    'assets/zhou_white.png',
  ];
  final List<String> RImages = [
    'assets/comn_WYH.png',
    'assets/comn_CQX.png',
    'assets/comn_XRH.png',
    'assets/comn_FS.png',
    'assets/comn_WYH2.png',
    'assets/li_white.png',
    'assets/qian_white.png',
    'assets/sun_white.png',
    'assets/wu_white.png',
    'assets/zhao_white.png',
    'assets/zhou_white.png',
  ];
  final List<String> LImages = [
    'assets/comn_WYH.png',
    'assets/comn_CQX.png',
    'assets/comn_XRH.png',
    'assets/comn_FS.png',
    'assets/comn_WYH2.png',
    'assets/li_white.png',
    'assets/qian_white.png',
    'assets/sun_white.png',
    'assets/wu_white.png',
    'assets/zhao_white.png',
    'assets/zhou_white.png',
  ];

  late ImageModel UColorItem;
  late ImageModel FColorItem;
  late ImageModel DColorItem;
  late ImageModel BColorItem;
  late ImageModel RColorItem;
  late ImageModel LColorItem;

  late Rx<ImageModel> selectedSegment = FColorItem.obs;

  List<BoxModel> boxs = [];
  ZVector _rotate = const ZVector.only(x: -tau / 12, y: tau / 8);
  late AnimationController animationController;
  Animation? rotateYAnimation;
  Animation? rotateXAnimation;

  @override
  void onInit() {
    UColorItem = ImageModel(UColor, UImages)..image.value = UImages.first;
    FColorItem = ImageModel(FColor, FImages)..image.value = FImages.first;
    DColorItem = ImageModel(DColor, DImages)..image.value = DImages.first;
    BColorItem = ImageModel(BColor, BImages)..image.value = BImages.first;
    RColorItem = ImageModel(RColor, RImages)..image.value = RImages.first;
    LColorItem = ImageModel(LColor, LImages)..image.value = LImages.first;
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
    for (BoxModel m in solvedList) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      boxs.add(newModel);
    }
    boxs.firstWhere((element) => element.id == BoxName.W).topImage = 'assets/logo.png';
  }

  void onColorChanged(ImageModel? value) {
    if (value != null) {
      selectedSegment.value = value;
      print('_selectedSegment=${selectedSegment.value.color}');
    }
  }

  void toSkin() {
    Get.toNamed(Routes.SKIN, arguments: boxs);
  }
}

class ImageModel {
  Color color;
  var image = ''.obs;
  List<String> images;

  ImageModel(this.color, this.images);
}
