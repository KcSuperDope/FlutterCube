import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'color_box_controller.dart';

class ColorBox extends StatelessWidget {
  final BoxModel boxModel;

  const ColorBox({super.key, required this.boxModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: boxModel.id,
        init: ColorBoxController(),
        builder: (c) {
          return ZPositioned(
              translate: boxModel.translate ?? ZVector.zero,
              child: ZBoxToBoxAdapter(
                height: boxSize,
                width: boxSize,
                depth: boxSize,
                color: defaultColor,
                stroke: 0,
                front: boxModel.frontColor != null
                    ? _slice(
                        boxModel.frontColor!, () => c.onTapSlice(boxModel, boxModel.frontColor!, F))
                    : null,
                top: boxModel.topColor != null
                    ? _slice(
                        boxModel.topColor!, () => c.onTapSlice(boxModel, boxModel.topColor!, U))
                    : null,
                left: boxModel.leftColor != null
                    ? _slice(
                        boxModel.leftColor!, () => c.onTapSlice(boxModel, boxModel.leftColor!, L))
                    : null,
                right: boxModel.rightColor != null
                    ? _slice(
                        boxModel.rightColor!, () => c.onTapSlice(boxModel, boxModel.rightColor!, R))
                    : null,
                bottom: boxModel.bottomColor != null
                    ? _slice(boxModel.bottomColor!,
                        () => c.onTapSlice(boxModel, boxModel.bottomColor!, D))
                    : null,
                rear: boxModel.rearColor != null
                    ? _slice(
                        boxModel.rearColor!, () => c.onTapSlice(boxModel, boxModel.rearColor!, B))
                    : null,
              ));
        });
  }

  Widget _slice(Color color, VoidCallback onTap) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: boxSize,
          height: boxSize,
          color: defaultColor,
          child: UnconstrainedBox(
            child: Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ));
  }
}
