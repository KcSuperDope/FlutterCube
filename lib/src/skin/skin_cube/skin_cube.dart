import 'package:cubestation_flutter/src/skin/skin_cube/skin_box.dart';
import 'package:cubestation_flutter/src/skin/skin_cube/skin_cube_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';

class SkinCube extends StatelessWidget {
  const SkinCube({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SkinCubeController>(
        init: SkinCubeController(),
        initState: (_) {},
        builder: (c) {
          final curved = CurvedAnimation(parent: c.animationController, curve: Curves.easeInOut);
          return ZDragDetector(
              builder: (context, dragController) => AnimatedBuilder(
                  animation: c.animationController,
                  builder: (context, _) => ZIllustration(zoom: 1.5, children: [
                        ZPositioned(
                          rotate:
                              ZVector(c.rotate.x, -tau * curved.value + c.rotate.y, c.rotate.z) +
                                  dragController.rotate,
                          child: ZGroup(
                              children: c.otherBoxList.map((e) => SkinBox(boxModel: e)).toList()),
                        )
                      ])));
        });
  }
}
