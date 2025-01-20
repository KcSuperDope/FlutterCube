import 'dart:ui';

import 'package:cubestation_flutter/common/button.dart';
import 'package:cubestation_flutter/common/color.dart';
import 'package:cubestation_flutter/cube/cube.dart';
import 'package:cubestation_flutter/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Offstage(
            offstage: !controller.deviceConnected.value,
            child: TextButton(
              onPressed: controller.connectDevice,
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(96.w, 30.h)),
                  padding: MaterialStateProperty.all(EdgeInsets.zero)),
              child: Row(
                children: [
                  Image.asset('assets/icon_change.png', width: 24.w, height: 24.h),
                  SizedBox(width: 8.w),
                  Text(
                    controller.deviceInfoModel.deviceName,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500, color: CSColors.primaryText),
                  ),
                ],
              ),
            ))),
        actions: [
          TextButton(
            onPressed: controller.deviceInfo,
            style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(96.w, 30.h))),
            child: Row(
              children: [
                Text(
                  '设备详情',
                  style: TextStyle(
                      color: CSColors.primaryText, fontSize: 14, fontWeight: FontWeight.normal),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.arrow_forward_ios, size: 12, color: CSColors.primaryText),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFE7F1FA), Color.fromRGBO(230, 239, 245, 0)])),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  _subTitleView(),
                  _cubeView(),
                  SizedBox(height: 10.h),
                  _connectView(),
                  _playView()
                ],
              ),
            ),
          ),
          _bottomView(),
          SizedBox(height: 6.h),
          _bottomNavigationView(),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  Widget _subTitleView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton(
            onPressed: () => Get.toNamed(Routes.RECORD),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CSColors.auxiliary),
                minimumSize: MaterialStateProperty.all(Size(48.w, 30.h)),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)))),
            child: Row(
              children: [
                Text(
                  '记录',
                  style: TextStyle(
                      color: CSColors.primaryText, fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cubeView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: Get.height * 0.3.h,
          child: Obx(() => controller.deviceConnected.value
              ? Cube(static: controller.isScrambling.value)
              : Image.asset(
                  'assets/cube.png',
                )),
        ),
        Obx(() => Offstage(
              offstage: controller.deviceConnected.value,
              child: Container(
                height: 46.h,
                width: 208.w,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(0, 0, 0, 0),
                  Color.fromRGBO(0, 0, 0, 0.77),
                  Color.fromRGBO(0, 0, 0, 1),
                  Color.fromRGBO(0, 0, 0, 0)
                ])),
                alignment: Alignment.center,
                child: const Text(
                  '设备未连接',
                  style:
                      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ))
      ],
    );
  }

  Widget _connectView() {
    return Obx(() => Offstage(
          offstage: controller.isPlaying.value,
          child: controller.deviceConnected.value
              ? ButtonUtils.iconButton(
                  text: '开始练习',
                  icon: 'icon_battle',
                  iconSize: 24,
                  width: Get.width * 0.35.w,
                  onPressed: controller.startPractice)
              : GestureDetector(
                  onTap: controller.connectDevice,
                  child: Container(
                    width: Get.width * 0.7.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: CSColors.primary,
                        borderRadius: BorderRadius.circular(33),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 8),
                              spreadRadius: -8,
                              blurRadius: 28,
                              color: Color(0xFF52B1F5))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon_link.png',
                          width: 34.w,
                          height: 34.w,
                        ),
                        Text(
                          '连接魔方',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: CSColors.auxiliary),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }

  Widget _playView() {
    return Obx(() => Offstage(
        offstage: !controller.isPlaying.value,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(41, 162, 255, 0),
                  Color.fromRGBO(41, 162, 255, 1),
                  Color.fromRGBO(41, 162, 255, 0),
                ])),
                child: Column(
                  children: [
                    Text(
                      controller.showText.value,
                      style: TextStyle(
                          fontSize: controller.isScrambling.value ? 24 : 48,
                          fontWeight: FontWeight.bold,
                          color: CSColors.primaryText,
                          fontFeatures: const [FontFeature.tabularFigures()]),
                    ),
                    Offstage(
                      offstage: !controller.isScrambling.value,
                      child: Text(
                        controller.scrambleText,
                        style: TextStyle(
                            fontSize: 24, color: CSColors.primaryText, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 8.h),
            ButtonUtils.iconButton(text: '放弃', icon: 'icon_close', onPressed: controller.giveUp)
          ],
        )));
  }

  Widget _bottomView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          FilledButton(
            onPressed: controller.statusSync,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CSColors.commonLightBlue),
                minimumSize: MaterialStateProperty.all(Size(82.w, 34.h)),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)))),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_cloudy.png',
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  '同步',
                  style: TextStyle(
                      color: CSColors.primaryText, fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          FilledButton(
            onPressed: controller.toFastSolution,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CSColors.commonLightBlue),
                minimumSize: MaterialStateProperty.all(Size(82.w, 34.h)),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)))),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_recover.png',
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  '快速复原',
                  style: TextStyle(
                      color: CSColors.primaryText, fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: FilledButton(
          onPressed: controller.toDemo,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xFFFFF8DE)),
              minimumSize: MaterialStateProperty.all(const Size.fromHeight(90)),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
          child: Row(
            children: [
              Container(
                height: 64.w,
                width: 64.w,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(width: 2, color: CSColors.commonYellow)),
                child: Center(
                    child:
                        Image.asset('assets/icon_knowledge_yellow.png', width: 42.w, height: 32.h)),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '魔方公式',
                    style: TextStyle(
                        color: CSColors.primaryText, fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '复原白色小花',
                    style: TextStyle(
                        color: CSColors.primaryText, fontSize: 22, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset('assets/icon_forward_yellow.png', width: 28.w, height: 28.w)
            ],
          )),
    );
  }
}
