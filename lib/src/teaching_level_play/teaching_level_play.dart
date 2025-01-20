import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/cube/cube.dart';
import 'package:cubestation_flutter/cube/cube_constant.dart';
import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'teaching_level_play_controller.dart';

class TeachingLevelPlayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachingLevelPlayController>(() => TeachingLevelPlayController());
  }
}

class TeachingLevelPlayPage extends GetView<TeachingLevelPlayController> {

  const TeachingLevelPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: controller.onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text(controller.model.level!)),
            centerTitle: true,
            actions: [
              IconButton(
                key: controller.popKey,
                onPressed: controller.toTeachingDialog,
                icon: Image.asset('assets/icon_teach.png', width: 24, height: 20),
              )
            ],
          ),
          body: Obx(() => controller.isBasicLevel
              ? Obx(() => _basicContent(controller
                  .model
                  .teachingDialogModels!
                  .first
                  .teachingDialogItemModels![controller.currentQuestion.value]
                  .teachingBasicsPlayModel!))
              : Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFE7F1FA), Color.fromRGBO(230, 239, 245, 0)])),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.1),
                      const Expanded(child: Cube(static: true)),
                      // Obx(() => Text(
                      //       controller.scrambleController.showSequence.join(' '),
                      //       style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      //     )),
                      Obx(() => Offstage(
                          offstage: controller.isPlaying.value,
                          child: Container(
                              width: Get.width * 0.7,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Color.fromRGBO(41, 162, 255, 0),
                                Color.fromRGBO(41, 162, 255, 1),
                                Color.fromRGBO(41, 162, 255, 0),
                              ])),
                              child: Text(
                                '请随意打乱魔方',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: CSColors.auxiliary),
                              )))),
                      Obx(() => Visibility(
                          visible: controller.isPlaying.value && controller.openAiTeaching.value,
                          child: _aiTips())),
                      const SizedBox(height: 12),
                      Obx(() => Offstage(
                          offstage: !controller.isPlaying.value,
                          child: controller.openAiTeaching.value
                              ? ButtonUtils.iconButton(
                                  text: '关闭教学',
                                  icon: 'icon_close',
                                  onPressed: controller.closeAiTeach)
                              : ButtonUtils.iconButton(
                                  text: 'AI教学',
                                  icon: 'icon_ai',
                                  onPressed: controller.openAiTeach))),
                      Obx(() => Offstage(
                          offstage: controller.isPlaying.value,
                          child: Container(
                            margin: EdgeInsets.only(top: Get.height * 0.1),
                            child: ButtonUtils.iconButton(
                                text: '完成检测',
                                icon: 'icon_complete',
                                onPressed: controller.completeCheck),
                          ))),
                      const Spacer(),
                    ],
                  ),
                )),
          bottomSheet: Obx(() => Visibility(
                visible: controller.isPlaying.value || controller.isBasicLevel,
                child: Container(
                  decoration: BoxDecoration(
                      color: CSColors.auxiliary,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, -2),
                            blurRadius: 4,
                            color: Color.fromRGBO(41, 162, 255, 0.2))
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  height: Get.height * 0.25,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        '目标',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700, color: CSColors.primaryText),
                      ),
                      const SizedBox(height: 14),
                      Image.asset(
                        'assets/${controller.model.goalImage!}.png',
                        width: Get.height * 0.13,
                        height: Get.height * 0.13,
                      ),
                      const SizedBox(height: 12),
                      Text(
                          controller.isBasicLevel
                              ? '完成${controller.model.goal!}答题'
                              : '复原${controller.model.goal!}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: CSColors.primaryText)),
                    ],
                  ),
                ),
              )),
        ));
  }

  Widget _basicContent(TeachingBasicsPlayModel model) {
    return Container(
      width: Get.width,
      height: Get.height * 0.75,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFE7F1FA), Color.fromRGBO(230, 239, 245, 0)])),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text(controller.order.value.isEmpty ? model.order! : controller.order.value,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: CSColors.primaryText)),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
                controller.question.value.isEmpty ? model.question! : controller.question.value,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.normal, color: CSColors.primaryText)),
          ),
          const SizedBox(height: 12),
          if (!controller.isPlaying.value)
            Center(
              child: Image.asset(
                'assets/${model.image!}.png',
                width: 250,
                height: 250,
              ),
            ),
          if (controller.isPlaying.value) const Expanded(child: Cube(static: true)),
          const SizedBox(height: 12),
          if (!controller.isPlaying.value)
            Wrap(
                spacing: 20,
                runSpacing: 12,
                children: model.options!
                    .asMap()
                    .keys
                    .map((i) => FilledButton(
                          onPressed: () => controller.selectOption(i),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(Get.width * 0.4, 40)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(48))),
                              backgroundColor: MaterialStateProperty.all(
                                  controller.currentSelectedOption.value == -1
                                      ? CSColors.secondaryText
                                      : controller.currentSelectedOption.value == i
                                          ? model.options![i].right!
                                              ? CSColors.primary
                                              : CSColors.commonRed
                                          : model.options![i].right!
                                              ? CSColors.primary
                                              : CSColors.secondaryText)),
                          child: Text(model.options![i].text!),
                        ))
                    .toList())
        ],
      ),
    );
  }

  Widget _aiTips() {
    return Container(
      height: 68,
      width: double.infinity,
      color: const Color.fromRGBO(41, 162, 255, 0.5),
      alignment: Alignment.center,
      child: EasyRichText(
        controller.aiTips.value,
        defaultStyle:
            TextStyle(color: CSColors.auxiliary, fontSize: 14, fontWeight: FontWeight.normal),
        patternList: [
          EasyRichTextPattern(
            targetString: '蓝色中心块',
            style: const TextStyle(color: BColor),
          ),
          EasyRichTextPattern(
            targetString: '蓝色块相对',
            style: const TextStyle(color: BColor),
          ),
          EasyRichTextPattern(
            targetString: '蓝',
            style: const TextStyle(color: BColor),
          ),
          EasyRichTextPattern(
            targetString: '橙色中心块',
            style: const TextStyle(color: LColor),
          ),
          EasyRichTextPattern(
            targetString: '橙色块相对',
            style: const TextStyle(color: LColor),
          ),
          EasyRichTextPattern(
            targetString: '橙',
            style: const TextStyle(color: LColor),
          ),
          EasyRichTextPattern(
            targetString: '红色中心块',
            style: const TextStyle(color: RColor),
          ),
          EasyRichTextPattern(
            targetString: '红色块相对',
            style: const TextStyle(color: RColor),
          ),
          EasyRichTextPattern(
            targetString: '红',
            style: const TextStyle(color: RColor),
          ),
          EasyRichTextPattern(
            targetString: '绿色中心块',
            style: const TextStyle(color: FColor),
          ),
          EasyRichTextPattern(
            targetString: '绿',
            style: const TextStyle(color: FColor),
          ),
        ],
      ),
    );
  }
}
