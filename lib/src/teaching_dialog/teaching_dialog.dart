import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:cubestation_flutter/src/teaching/teaching_widget.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teach_cube/teach_cube.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zflutter/zflutter.dart';
import 'teaching_dialog_controller.dart';

class TeachingDialogBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachingDialogController>(() => TeachingDialogController());
  }
}

class TeachingDialog extends GetView<TeachingDialogController> {
  const TeachingDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    controller.currentStep.value = Get.arguments['step'] ?? 0;
    controller.currentItem.value = Get.arguments['item'] ?? 0;
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: Get.height * 0.72,
        width: Get.width * 0.8,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            _content(),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8.0),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close),
                iconSize: 30,
                alignment: Alignment.topRight,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _content() {
    final List<TeachingDialogModel> list = controller.model.teachingDialogModels!;
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          alignment: Alignment.center,
          child: Text(
            controller.model.goal!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const SizedBox(height: 14),
        Obx(() => _contentItem(list[controller.currentStep.value]
            .teachingDialogItemModels![controller.currentItem.value])),
        Obx(() => _segmentedView(list[controller.currentStep.value].teachingDialogItemModels!)),
        _steps(list),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _segmentedView(List<TeachingDialogItemModel> list) {
    if (controller.isBasicLevel) {
      return _basicSegmentedView(list.length);
    }
    if (list.length == 1) {
      TeachingDialogItemModel m = list.first;
      return _levelItem(m.statusImage!, m.getStarCount);
    } else {
      return CupertinoSlidingSegmentedControl(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: const Color.fromRGBO(41, 162, 255, 0.4),
        thumbColor: CSColors.primary,
        groupValue: controller.currentItem.value,
        onValueChanged: controller.onSegementChanged,
        children: list
            .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: levelItemCard(e.statusImage!, e.getStarCount)))
            .toList()
            .asMap(),
      );
    }
  }

  Widget _basicSegmentedView(int length) {
    return Container(
      width: Get.width,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: const Color.fromRGBO(41, 162, 255, 0.4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Obx(() => Offstage(
                  offstage: controller.currentItem.value == 0,
                  child: IconButton(
                    onPressed: () => controller.currentItem.value--,
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                )),
          ),
          if (controller.currentStep.value == 0)
            Expanded(
              child: Center(
                child: Obx(() => Text('${controller.currentItem.value + 1}/$length',
                    style: Get.textTheme.bodyLarge)),
              ),
            ),
          if (controller.currentStep.value == 1)
            Expanded(
              child: Center(
                child: Text('右手公式', style: Get.textTheme.bodyLarge),
              ),
            ),
          if (controller.currentStep.value == 2)
            Expanded(
              child: Center(
                child: Text('左手公式', style: Get.textTheme.bodyLarge),
              ),
            ),
          Expanded(
            child: Obx(() => Offstage(
                  offstage: controller.currentItem.value == length - 1,
                  child: IconButton(
                    onPressed: () => controller.currentItem.value++,
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _contentItem(TeachingDialogItemModel m) {
    return controller.isBasicLevel
        ? Column(
            children: [
              Text(
                m.formula!,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.secondaryText),
              ),
              const SizedBox(height: 12),
              m.gif != null
                  ? Image(image: AssetImage('assets/${m.gif}.gif'))
                  : Image.asset('assets/${m.statusImage!}.png', scale: 3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  m.explain!,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.primaryText),
                ),
              )
            ],
          )
        : Column(
            children: [
              Text(
                m.formula!,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.secondaryText),
              ),
              _cube(m.statusImage!, m.teachingCubeModel?.rotate),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 16, bottom: 4),
                child: Text(
                  '已完成${m.getStarCount}次',
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal, color: CSColors.secondaryText),
                ),
              ),
            ],
          );
  }

  Widget _cube(String level, ZVector? rotate) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
            width: Get.width * 0.8,
            height: Get.width * 0.6,
            child: TeachCube(key: Key(level), level: level, initRotate: rotate)),
        Obx(() => Offstage(
              offstage: controller.startedPlaying.value,
              child: GestureDetector(
                  onTap: controller.started,
                  child: Image.asset('assets/start_play.png', width: 70, height: 70)),
            ))
      ],
    );
  }

  Widget _levelItem(String image, int getStarCount) {
    return Container(
        width: Get.width,
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(41, 162, 255, 0.4), borderRadius: BorderRadius.circular(8)),
        child: levelItemCard(image, getStarCount));
  }

  Widget _steps(List<TeachingDialogModel> list) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: list
            .asMap()
            .keys
            .map((i) => Obx(() => Column(
                  children: [
                    Offstage(offstage: controller.currentStep.value != i, child: _triangle()),
                    const SizedBox(height: 18),
                    Opacity(
                        opacity: controller.currentStep.value == i ? 1.0 : 0.5,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => controller.onStepChanged(i),
                              child: Container(
                                height: 58,
                                width: 58,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 4,
                                        color: controller.currentStep.value == i
                                            ? CSColors.primary
                                            : CSColors.primaryText),
                                    borderRadius: BorderRadius.circular(33)),
                                child: Center(
                                  child: Image.asset(
                                    'assets/${list[i].goalImage}.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              list[i].step!,
                              style: Get.textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ],
                )))
            .toList());
  }

  Widget _triangle() {
    return Container(
      width: 24,
      height: 0,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
              color: Color.fromRGBO(41, 162, 255, 0.4), width: 12, style: BorderStyle.solid),
          right: BorderSide(color: Colors.transparent, width: 12, style: BorderStyle.solid),
          left: BorderSide(color: Colors.transparent, width: 12, style: BorderStyle.solid),
        ),
      ),
    );
  }
}
