import 'package:cubestation_flutter/src/record/record_model.dart';
import 'package:cubestation_flutter/src/replay/replay_cube/replay_cube_controller.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teach_cube/teach_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

class ReplayCube extends StatelessWidget {
  final RecordModel? record;

  const ReplayCube({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReplayCubeController>(
      init: ReplayCubeController(record!),
      initState: (_) {},
      builder: (c) {
        return ZDragDetector(builder: (context, dragController) {
          return ZIllustration(children: [
            ZPositioned(
                rotate: c.rotate,
                child: ZGroup(children: [
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
