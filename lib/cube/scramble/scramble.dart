import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/scramble/scramble_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

const double _arrowWidth = boxSize + boxStroke;
const double _arrowOffset = boxOffset * 1.7;

class ScrambleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ScrambleController>(ScrambleController());
  }
}

class Scramble extends GetView<ScrambleController> {
  const Scramble({super.key});

  @override
  Widget build(BuildContext context) {
    return ZPositioned(
        translate: controller.translate, rotate: controller.rotate, child: _arrowGroup());
  }

  Widget _arrowGroup() {
    return ZGroup(children: [
      ZPositioned(translate: const ZVector.only(z: _arrowOffset), child: _arrow()),
      ZPositioned(translate: const ZVector.only(z: _arrowOffset, x: _arrowWidth), child: _arrow()),
      ZPositioned(translate: const ZVector.only(z: _arrowOffset, x: -_arrowWidth), child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(z: -_arrowOffset),
          rotate: const ZVector.only(y: tau / 2),
          child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(z: -_arrowOffset, x: _arrowWidth),
          rotate: const ZVector.only(y: tau / 2),
          child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(z: -_arrowOffset, x: -_arrowWidth),
          rotate: const ZVector.only(y: tau / 2),
          child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(x: _arrowOffset),
          rotate: const ZVector.only(y: -tau / 4),
          child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(x: _arrowOffset, z: _arrowWidth),
          rotate: const ZVector.only(y: -tau / 4),
          child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(x: _arrowOffset, z: -_arrowWidth),
          rotate: const ZVector.only(y: -tau / 4),
          child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(x: -_arrowOffset),
          rotate: const ZVector.only(y: tau / 4),
          child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(x: -_arrowOffset, z: _arrowWidth),
          rotate: const ZVector.only(y: tau / 4),
          child: _arrow()),
      ZPositioned(
          translate: const ZVector.only(x: -_arrowOffset, z: -_arrowWidth),
          rotate: const ZVector.only(y: tau / 4),
          child: _arrow())
    ]);
  }

  Widget _arrow() {
    return ZToBoxAdapter(
      height: _arrowWidth,
      width: _arrowWidth,
      child: Image.asset('assets/arrow.gif'),
    );
  }
}
