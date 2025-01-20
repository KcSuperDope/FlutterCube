import 'package:cubestation_flutter/cube/cube_controller.dart';
import 'package:cubestation_flutter/cube/scramble/scramble.dart';
import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:cubestation_flutter/src/replay/replay_cube/replay_cube_controller.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teach_cube/teach_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Cube extends StatelessWidget {
  final bool static;
  const Cube({super.key, this.static = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CubeController>(
      init: CubeController(),                                                       
      initState: (_) {},
      builder: (c) {
        return ZDragDetector(builder: (context, dragController) {
          return ZIllustration(children: [
            ZPositioned(
                rotate: static
                    ? ZVector(c.rotate.x, c.rotate.y + c.rotateAllAnimation.value, c.rotate.z)
                    : ZVector.zero,
                matrix3: static ? vector.Matrix3.identity() : c.curMatrix3,
                child: ZGroup(children: [
                  if (c.isScrambling) Scramble(),                             
                  ZPositioned(
                    rotate: ZVector(c.rotateXAnimation.value, c.rotateYAnimation.value,
                        c.rotateZAnimation.value),
                    child: ZGroup(
                        children: c.rotateBoxList.map((e) => TeachBox(boxModel: e)).toList()),
                  ),
                  ZGroup(children: c.otherBoxList.map((e) => TeachBox(boxModel: e)).toList()),
                ]))
          ]);
        });
      },
    );
  }
}
