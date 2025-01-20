import 'package:cubestation_flutter/src/challenge/challenge_controller.dart';
import 'package:cubestation_flutter/src/home/home_controller.dart';
import 'package:cubestation_flutter/src/initial/initial_controller.dart';
import 'package:cubestation_flutter/src/mine/mine_controller.dart';
import 'package:cubestation_flutter/src/teaching/teaching_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}

class InitialPage extends GetView<InitialController> {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.pageList[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icon_home_inactive.png', width: 24, height: 24),
                  activeIcon: Image.asset('assets/icon_home_active.png', width: 24, height: 24),
                  label: '首页'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icon_teach_inactive.png', width: 24, height: 24),
                  activeIcon: Image.asset('assets/icon_teach_active.png', width: 24, height: 24),
                  label: '教学'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icon_challenge_inactive.png', width: 24, height: 24),
                  activeIcon:
                      Image.asset('assets/icon_challenge_active.png', width: 24, height: 24),
                  label: '挑战'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icon_mine_inactive.png', width: 24, height: 24),
                  activeIcon: Image.asset('assets/icon_mine_active.png', width: 24, height: 24),
                  label: '我的'),
            ],
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.currentIndex.value = value;
            },
          )),
    );
  }
}
