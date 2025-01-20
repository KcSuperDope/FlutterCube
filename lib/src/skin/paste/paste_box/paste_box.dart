import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'paste_box_controller.dart';

class PasteBox extends StatelessWidget {
  final BoxModel boxModel;

  const PasteBox({super.key, required this.boxModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: boxModel.id,
        init: PasteBoxController(),
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
                    ? _slice(boxModel.frontColor!, boxModel.frontImage,
                        () => c.onTapSlice(boxModel, boxModel.frontColor!, F, boxModel.frontImage))
                    : null,
                top: boxModel.topColor != null
                    ? _slice(boxModel.topColor!, boxModel.topImage,
                        () => c.onTapSlice(boxModel, boxModel.topColor!, U, boxModel.topImage),
                        flipX: true, rotate: true)
                    : null,
                left: boxModel.leftColor != null
                    ? _slice(boxModel.leftColor!, boxModel.leftImage,
                        () => c.onTapSlice(boxModel, boxModel.leftColor!, L, boxModel.leftImage),
                        flipX: true)
                    : null,
                right: boxModel.rightColor != null
                    ? _slice(boxModel.rightColor!, boxModel.rightImage,
                        () => c.onTapSlice(boxModel, boxModel.rightColor!, R, boxModel.rightImage),
                        flipX: true)
                    : null,
                bottom: boxModel.bottomColor != null
                    ? _slice(
                        boxModel.bottomColor!,
                        boxModel.bottomImage,
                        () =>
                            c.onTapSlice(boxModel, boxModel.bottomColor!, D, boxModel.bottomImage),
                        flipX: true,
                        rotate: true)
                    : null,
                rear: boxModel.rearColor != null
                    ? _slice(boxModel.rearColor!, boxModel.rearImage,
                        () => c.onTapSlice(boxModel, boxModel.rearColor!, B, boxModel.rearImage))
                    : null,
              ));
        });
  }

  Widget _slice(Color color, String? image, VoidCallback onTap,
      {bool flipX = false, bool rotate = false}) {
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
              child: image != null
                  ? Transform.rotate(
                      angle: rotate ? tau / 2 : 0,
                      child: Transform.flip(flipX: flipX, child: Image.asset(image)))
                  : null,
            ),
          ),
        ));
  }
}
