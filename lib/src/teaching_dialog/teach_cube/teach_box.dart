import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';

class TeachBox extends StatelessWidget {
  final BoxModel boxModel;
  const TeachBox({super.key, required this.boxModel});

  @override
  Widget build(BuildContext context) {
    return ZPositioned(
        translate: boxModel.translate ?? ZVector.zero,
        child: ZGroup(children: [
          const ZBox(
              height: boxSize, width: boxSize, depth: boxSize, color: defaultColor, stroke: 0),
          _slice(const ZVector.only(z: boxOffset * 0.5), boxModel.frontColor ?? defaultColor),
          _slice(const ZVector.only(z: -boxOffset * 0.5), boxModel.rearColor ?? defaultColor),
          _slice(const ZVector.only(x: -boxOffset * 0.5), boxModel.leftColor ?? defaultColor,
              rotate: const ZVector.only(y: tau / 4)),
          _slice(const ZVector.only(x: boxOffset * 0.5), boxModel.rightColor ?? defaultColor,
              rotate: const ZVector.only(y: tau / 4)),
          _slice(const ZVector.only(y: boxOffset * 0.5), boxModel.bottomColor ?? defaultColor,
              rotate: const ZVector.only(x: tau / 4)),
          _slice(const ZVector.only(y: -boxOffset * 0.5), boxModel.topColor ?? defaultColor,
              rotate: const ZVector.only(x: tau / 4)),
        ]));
  }

  Widget _slice(ZVector translate, Color color, {ZVector? rotate}) {
    return ZPositioned(
        translate: translate,
        rotate: rotate ?? ZVector.zero,
        child: ZRoundedRect(
          fill: true,
          stroke: 3,
          width: 34,
          height: 34,
          borderRadius: 4,
          color: color,
        ));
  }
}
