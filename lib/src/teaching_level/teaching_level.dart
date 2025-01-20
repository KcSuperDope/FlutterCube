import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:cubestation_flutter/src/teaching/teaching_widget.dart';
import 'package:cubestation_flutter/src/teaching_dialog/teaching_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'teaching_level_controller.dart';

class TeachingLevelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachingLevelController>(() => TeachingLevelController());
  }
}

class TeachingLevelPage extends GetView<TeachingLevelController> {
  const TeachingLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.selectedTeachingModel.level!)),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/bg_teach.png'), fit: BoxFit.fill)),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(
              '完成一次可获得一颗星',
              style: TextStyle(color: CSColors.secondaryText, fontSize: 12),
            ),
            const Spacer(),
            Row(
              children: [
                _tabSideNavigation(),
                _levelTree(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 30),
          child: ButtonUtils.iconButton(
              text: '开始挑战',
              icon: 'icon_battle',
              iconSize: 24,
              width: Get.width * 0.35,
              onPressed: () {
                Get.find<HomeController>().isConnectDevice(() {
                  Get.toNamed(Routes.TEACH_LEVEL_PLAY, arguments: controller.selectedLevel.value);
                });
              })),
    );
  }

  Widget _tabSideNavigation() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(offset: Offset(0, 8), blurRadius: 8, color: Color.fromRGBO(82, 177, 245, 0.5))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, bottom: 12, top: 12),
        child: Column(
          children: controller.list.asMap().keys.map((i) {
            return Column(
              children: [
                Obx(() => GestureDetector(
                      onTap: () {
                        if (controller.list[i].lock) {
                          Fluttertoast.showToast(msg: '暂未解锁');
                          return;
                        }
                        controller.selectedLevel.value = i;
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: controller.selectedLevel.value == i
                              ? CSColors.primary
                              : CSColors.auxiliary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            topLeft: Radius.circular(6),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: controller.selectedLevel.value == i
                                    ? CSColors.auxiliary
                                    : CSColors.lightBackground,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Opacity(
                                  opacity: controller.selectedLevel.value == i ? 1 : 0.5,
                                  child: Image.asset(
                                    'assets/${controller.list[i].goalImage}.png',
                                    width: 36,
                                    height: 36,
                                  ),
                                ),
                              ),
                            ),
                            if (controller.list[i].lock) _barrier()
                          ],
                        ),
                      ),
                    )),
                if (i != 8)
                  Container(
                    color: CSColors.lightBackground,
                    height: 12,
                    width: 6,
                    margin: const EdgeInsets.only(right: 12),
                  )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _levelTree() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Obx(() => Stack(
              alignment: AlignmentDirectional.center,
              children: [
                if (controller.selectedLevel.value == 0)
                  Image.asset(
                    'assets/line2.png',
                    height: Get.height * 0.4,
                  ),
                if (controller.selectedLevel.value == 1)
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.1),
                    child: Image.asset(
                      'assets/line3.png',
                      height: Get.height * 0.6,
                    ),
                  ),
                if (controller.selectedLevel.value == 2)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Image.asset(
                      'assets/line4.png',
                      height: Get.height * 0.6,
                    ),
                  ),
                controller.selectedLevel.value == 0
                    ? Column(
                        children: controller.selectedTeachingModel.teachingDialogModels!
                            .asMap()
                            .keys
                            .map((step) =>
                                Container(margin: EdgeInsets.only(bottom: 68), child: _level(step)))
                            .toList(),
                      )
                    : Column(
                        children: controller.selectedTeachingModel.teachingDialogModels!
                            .asMap()
                            .keys
                            .map((step) {
                          if (controller.selectedTeachingModel.teachingDialogModels![step]
                                  .teachingDialogItemModels!.length >
                              1) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 93),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: controller.selectedTeachingModel
                                      .teachingDialogModels![step].teachingDialogItemModels!
                                      .asMap()
                                      .keys
                                      .map((item) => _levelItem(step, item))
                                      .toList()),
                            );
                          } else {
                            return Container(
                                margin: EdgeInsets.only(bottom: 68), child: _level(step));
                          }
                        }).toList(),
                      )
              ],
            )),
      ),
    );
  }

  Widget _levelItem(int step, int item) {
    return GestureDetector(
        onTap: () {
          Get.dialog(TeachingDialog(), arguments: {'step': step, 'item': item});
        },
        child: levelItemCard(
            controller.selectedTeachingModel.teachingDialogModels![step]
                .teachingDialogItemModels![item].statusImage!,
            controller.selectedTeachingModel.teachingDialogModels![step]
                .teachingDialogItemModels![item].getStarCount));
  }

  Widget _level(int step) {
    return GestureDetector(
        onTap: () {
          Get.dialog(TeachingDialog(), arguments: {'step': step});
        },
        child: levelCard(
            controller.selectedTeachingModel.teachingDialogModels![step].goalImage!,
            controller.selectedTeachingModel.teachingDialogModels![step].teachingDialogItemModels!
                .first.getStarCount));
  }

  Widget _barrier() {
    return Container(
      width: 44,
      height: 44,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(40, 45, 49, 0.3),
      ),
      child: Center(child: Image.asset('assets/icon_lock.png', width: 16, height: 16)),
    );
  }
}
