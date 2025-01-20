import 'package:cubestation_flutter/cube/cube1_controller.dart';
import 'package:cubestation_flutter/cube/scramble/scramble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Cube1 extends StatelessWidget {
  final bool static;
  const Cube1({super.key, this.static = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Cube1Controller>(
      id: 'all',
      init: Cube1Controller(),
      initState: (_) {},
      builder: (c) {
        return ZDragDetector(builder: (context, dragController) {
          return ZIllustration(children: [
            ZPositioned(
              rotate: static
                  ? ZVector(c.rotate.x, c.rotate.y + c.rotateAllAnimation.value, c.rotate.z)
                  : ZVector.zero,
              matrix3: static ? vector.Matrix3.identity() : c.curMatrix3,
              child: ZGroup(
                  sortMode: SortMode.update,
                  children: [if (c.isScrambling) Scramble(), const _Cube()]),
            )
          ]);
        });
      },
    );
  }
}

class _Cube extends StatelessWidget {
  const _Cube();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Cube1Controller>(
        id: 'slice',
        init: Cube1Controller(),
        initState: (_) {},
        builder: (c) {
          return ZGroup(children: [
            ZPositioned(
              rotate: ZVector(
                  c.rotateXAnimation.value, c.rotateYAnimation.value, c.rotateZAnimation.value),
              child: ZGroup(children: c.rotateBoxList),
            ),
            ZGroup(children: c.otherBoxList),
          ]);
        });
  }
}
