import 'package:cubestation_flutter/cube/box/box.dart';
import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:flutter/material.dart';
import 'package:zflutter/zflutter.dart';

class SkinBox extends StatelessWidget {
  final BoxModel boxModel;
  const SkinBox({super.key, required this.boxModel});

  @override
  Widget build(BuildContext context) {
    return ZPositioned(
        translate: boxModel.translate ?? ZVector.zero,
        child: ZGroup(children: [
          const ZBox(
              height: boxSize, width: boxSize, depth: boxSize, color: defaultColor, stroke: 0),
          _skin(const ZVector.only(z: boxOffset * 0.5), boxModel.frontColor ?? defaultColor,
              image: boxModel.frontImage),
          _skin(const ZVector.only(z: -boxOffset * 0.5), boxModel.rearColor ?? defaultColor,
              image: boxModel.rearImage, imageRotate: const ZVector.only(y: tau / 2)),
          _skin(const ZVector.only(x: -boxOffset * 0.5), boxModel.leftColor ?? defaultColor,
              rotate: const ZVector.only(y: tau / 4), image: boxModel.leftImage),
          _skin(const ZVector.only(x: boxOffset * 0.5), boxModel.rightColor ?? defaultColor,
              rotate: const ZVector.only(y: tau / 4),
              image: boxModel.rightImage,
              imageRotate: const ZVector.only(y: tau / 2)),
          _skin(const ZVector.only(y: boxOffset * 0.5), boxModel.bottomColor ?? defaultColor,
              rotate: const ZVector.only(x: tau / 4),
              image: boxModel.bottomImage,
              imageRotate: const ZVector.only(x: tau / 2)),
          _skin(const ZVector.only(y: -boxOffset * 0.5), boxModel.topColor ?? defaultColor,
              rotate: const ZVector.only(x: tau / 4), image: boxModel.topImage),
        ]));
  }

  Widget _skin(
    ZVector translate,
    Color color, {
    ZVector? rotate,
    String? image,
    ZVector? imageRotate,
  }) {
    return ZPositioned(
        translate: translate,
        rotate: rotate ?? ZVector.zero,
        child: ZGroup(
          sortMode: SortMode.stack,
          children: [
            ZRoundedRect(
              width: 34,
              height: 34,
              borderRadius: 4,
              fill: true,
              color: color,
              stroke: 3,
            ),
            if (image != null)
              ZPositioned(
                rotate: imageRotate ?? ZVector.zero,
                child: ZToBoxAdapter(
                  width: 34,
                  height: 34,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox.fromSize(size: const Size(34, 34), child: Image.asset(image)),
                  ),
                ),
              ),
          ],
        ));
  }
}
