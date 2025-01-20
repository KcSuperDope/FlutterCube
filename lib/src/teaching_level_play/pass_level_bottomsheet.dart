import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/teaching/teaching_model.dart';
import 'package:cubestation_flutter/src/teaching/teaching_widget.dart';
import 'package:cubestation_flutter/src/teaching_level/teaching_level_controller.dart';
import 'package:cubestation_flutter/src/teaching_level_play/teaching_level_play_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassLevelBottomSheet extends StatelessWidget {
  final TeachingLevelController _teachingLevelController = Get.find<TeachingLevelController>();
  PassLevelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<TeachingModel> list = _teachingLevelController.list;
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '挑战完成！非常棒！',
                style: TextStyle(
                    color: CSColors.primaryText, fontSize: 18, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _levelGoal(list[_teachingLevelController.selectedLevel.value].goalImage!, '已完成'),
                  Obx(
                    () => _teachingLevelController.selectedLevel.value != 2
                        ? Row(
                            children: [
                              const SizedBox(width: 20),
                              Image.asset('assets/icon_forward.png', height: 20, width: 20),
                              Image.asset('assets/icon_forward.png', height: 20, width: 20),
                              const SizedBox(width: 20),
                              _levelNext(
                                  list[_teachingLevelController.selectedLevel.value + 1].goalImage!,
                                  '下一关')
                            ],
                          )
                        : const SizedBox(),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 1,
                    width: Get.width * 0.2,
                    color: CSColors.divider,
                  ),
                  Text(
                    '通关记录',
                    style: TextStyle(
                        color: CSColors.primaryText, fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    height: 1,
                    width: Get.width * 0.2,
                    color: CSColors.divider,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _passRecord(),
              const SizedBox(height: 12),
              _teachingLevelController.selectedLevel.value != 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonUtils.outlinedButton(
                            text: '结束挑战',
                            width: Get.width * 0.35,
                            onPressed: () {
                              Get.back();
                              Get.toNamed(Routes.TEACH_SETTLEMENT);
                            }),
                        ButtonUtils.filledButton(
                            text: '下一关',
                            width: Get.width * 0.35,
                            onPressed: () {
                              Get.find<TeachingLevelPlayController>().toNextLevel();
                            }),
                      ],
                    )
                  : ButtonUtils.outlinedButton(
                      text: '结束挑战',
                      width: Get.width * 0.35,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(Routes.TEACH_SETTLEMENT);
                      }),
              if (_teachingLevelController.selectedLevel.value != 2)
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icon_tips.png', width: 16, height: 16),
                      const SizedBox(width: 6),
                      Text(
                        '转动魔方开始下一关',
                        style: TextStyle(
                            color: CSColors.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              const SizedBox(height: 18),
            ],
          ),
        ));
  }

  Widget _levelGoal(String image, String text) {
    return Column(
      children: [
        Image.asset(
          'assets/$image.png',
          width: 100,
          height: 120,
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(
              color: Color(0xFFFF8A00), fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget _levelNext(String image, String text) {
    return Opacity(
      opacity: 0.6,
      child: Column(
        children: [
          Image.asset(
            'assets/$image.png',
            width: 80,
            height: 80,
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style:
                TextStyle(color: CSColors.primaryText, fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget _passRecord() {
    return Column(
      children: _teachingLevelController.selectedTeachingModel.teachingDialogModels!.map((m) {
        return Container(
            width: Get.width,
            height: 88,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: CSColors.commonLightBlue, borderRadius: BorderRadius.circular(20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: m.teachingDialogItemModels!.length > 3
                    ? _answer(m.teachingDialogItemModels!.first.getStarCount)
                    : m.teachingDialogItemModels!
                        .map((item) => levelItemCard(item.statusImage!, item.getStarCount))
                        .toList()));
      }).toList(),
    );
  }

  List<Widget> _answer(int getStarCount) {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/${getStarCount >= 1 ? 'icon_star_active' : 'icon_star_inactive'}.png',
              width: 48, height: 48),
          const Text('答对4题')
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/${getStarCount >= 2 ? 'icon_star_active' : 'icon_star_inactive'}.png',
              width: 48, height: 48),
          const Text('答对5题')
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/${getStarCount >= 3 ? 'icon_star_active' : 'icon_star_inactive'}.png',
              width: 48, height: 48),
          const Text('答对6题')
        ],
      ),
    ];
  }
}
