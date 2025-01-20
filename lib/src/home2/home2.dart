import 'package:cubestation_flutter/common/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'home2_controller.dart';

class Home2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Home2Controller>(() => Home2Controller());
  }
}

class Home2Page extends GetView<Home2Controller> {
  const Home2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFE7F1FA), Color.fromRGBO(230, 239, 245, 0)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_cubeView(), SizedBox(height: Get.height * 0.1.h), _bottomView()],
        ),
      ),
    );
  }

  Widget _cubeView() {
    return Center(
      child: SizedBox(
        height: Get.height * 0.3.h,
        child: Image.asset(
          'assets/cube.png',
        ),
      ),
    );
  }

  Widget _bottomView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          FilledButton(
            onPressed: controller.toColor,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CSColors.commonLightBlue),
                minimumSize: MaterialStateProperty.all(Size(82.w, 68.h)),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_recover.png',
                  // width: 24.w,
                  // height: 24.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  '填色复原',
                  style: TextStyle(
                      color: CSColors.primaryText, fontSize: 24, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          FilledButton(
            onPressed: controller.toSkin,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CSColors.commonLightBlue),
                minimumSize: MaterialStateProperty.all(Size(82.w, 68.h)),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_cloudy.png',
                  // width: 24.w,
                  // height: 24.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  '魔块贴图',
                  style: TextStyle(
                      color: CSColors.primaryText, fontSize: 24, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
