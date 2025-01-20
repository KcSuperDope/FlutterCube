import 'package:cubestation_flutter/cube/box/box_model.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teach_cube/teach_cube_controller.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teaching_dialog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'teach_box.dart';

class TeachCube extends StatefulWidget {
  final String level;
  final ZVector? initRotate;
  const TeachCube({super.key, required this.level, this.initRotate});
  @override
  State<StatefulWidget> createState() => TeachCubeState();
}

class TeachCubeState extends State<TeachCube> with TickerProviderStateMixin {
  late TeachCubeController c;

  @override
  void initState() {
    c = Get.put(TeachCubeController(() => setState(() {}), widget.initRotate), tag: widget.level);
    c.rotateAllAnimationController.addListener(() {
      setState(() {});
    });
    c.rotateXAnimationController.addListener(() {
      setState(() {});
    });
    c.rotateYAnimationController.addListener(() {
      setState(() {});
    });
    c.rotateZAnimationController.addListener(() {
      setState(() {});
    });
    initCubeStatus();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<TeachCubeController>(tag: widget.level);
    super.dispose();
  }

  ///初始化魔方状态
  void initCubeStatus() {
    c.level = widget.level;
    Get.find<TeachingDialogController>().startedPlaying.value = false;
    c.rotate = widget.initRotate ?? const ZVector.only(x: tau * 5 / 12, y: -tau / 12);
    c.getCubeStatus();
    c.otherBoxList.clear();
    c.rotateBoxList.clear();
    for (BoxModel m in c.cubeStatus) {
      BoxModel newModel = BoxModel.fromJson(m.toJson());
      c.otherBoxList.add(newModel);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ZDragDetector(builder: (context, dragController) {
      return ZIllustration(children: [
        ZPositioned(
            rotate: c.curRotateAxis == X
                ? ZVector(
                    c.rotate.x + c.rotateAllAnimation.value,
                    c.rotate.y + c.rotateAllAnimation.value * 2 / 9,
                    c.rotate.z < 0
                        ? c.rotate.z + c.rotateAllAnimation.value * 2 / 9
                        : c.rotate.z - c.rotateAllAnimation.value * 2 / 9)
                : ZVector(
                    c.rotate.x,
                    c.rotate.y + (c.curRotateAxis == Y ? c.rotateAllAnimation.value : 0),
                    c.rotate.z + (c.curRotateAxis == Z ? c.rotateAllAnimation.value : 0)),
            child: ZGroup(children: [
              ZPositioned(
                rotate: ZVector(
                    c.rotateXAnimation.value, c.rotateYAnimation.value, c.rotateZAnimation.value),
                child: ZGroup(children: c.rotateBoxList.map((e) => TeachBox(boxModel: e)).toList()),
              ),
              ZGroup(children: c.otherBoxList.map((e) => TeachBox(boxModel: e)).toList()),
            ]))
      ]);
    });
  }
}
