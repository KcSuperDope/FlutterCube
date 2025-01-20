import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:cubestation_flutter/src/teaching_settlement/pass_record.dart';
import 'package:cubestation_flutter/src/teaching_settlement/teaching_settlement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeachingSettlementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachingSettlementController>(() => TeachingSettlementController());
  }
}

class TeachingSettlementPage extends GetView<TeachingSettlementController> {
  const TeachingSettlementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('挑战成功'),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Get.until((route) => Get.currentRoute == Routes.INITIAL);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFFAF2E7), Color.fromRGBO(245, 239, 230, 0)])),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(right: 12),
                        alignment: Alignment.centerRight,
                        child: FilledButton(
                          onPressed: () => Get.toNamed(Routes.PASS_RECORD),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(CSColors.auxiliary),
                              minimumSize: MaterialStateProperty.all(const Size(96, 30)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)))),
                          child: Text(
                            '通关记录',
                            style: TextStyle(
                                color: CSColors.primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      const SizedBox(height: 76),
                      Image.asset(
                        'assets/${controller.teachingModel.goalImage}.png',
                        width: Get.width * 0.7,
                        height: Get.width * 0.7,
                      ),
                      const SizedBox(height: 50),
                      Container(
                          width: Get.width * 0.7,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Color.fromRGBO(255, 138, 0, 0),
                            Color.fromRGBO(255, 138, 0, 1),
                            Color.fromRGBO(255, 138, 0, 0),
                          ])),
                          child: Text(
                            '完成${controller.teachingModel.goal}${controller.teachingLevelPlayController.isBasicLevel ? '答题' : '复原'}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: CSColors.auxiliary),
                          )),
                    ],
                  ),
                ),
              ),
              ButtonUtils.iconButton(
                  text: '重新挑战', icon: 'icon_again', onPressed: controller.playAgain),
              SizedBox(height: Get.height * 0.1),
            ],
          ),
        ));
  }
}
